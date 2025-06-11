// Simulação de dados e gestão de localStorage
let empresas = JSON.parse(localStorage.getItem('empresas')) || [];
let locaisTrabalho = JSON.parse(localStorage.getItem('locaisTrabalho')) || [
    { id: 1, nome: 'Sede Principal', provincia: 'Maputo', distrito: 'Cidade de Maputo' }
];
let profissoes = JSON.parse(localStorage.getItem('profissoes')) || [
    { id: 1, nome: 'Desenvolvedor', descricao: 'Desenvolvimento de software' }
];
let funcionarios = JSON.parse(localStorage.getItem('funcionarios')) || [
    {
        id: 1, nome: 'João Silva', email: 'joao@exemplo.com', celular: '+258 84 123 4567', empresa: 'Empresa Demo', profissao: 'Desenvolvedor', provincia: 'Maputo',
        distrito: 'Cidade de Maputo', senha: '123456', status: 'aprovado'
    },
    {
        id: 2, nome: 'Maria Sousa', email: 'maria@exemplo.com', celular: '+258 82 987 6543', empresa: 'Empresa Demo', profissao: 'Analista', provincia: 'Maputo', distrito: 'Matola',
        senha: '123456', status: 'pendente'
    },
    {
        id: 3, nome: 'Pedro Machava', email: 'pedro@exemplo.com', celular: '+258 83 456 7890', empresa: 'Empresa Demo', profissao: 'Gerente', provincia: 'Gaza', distrito:
        'Xai-Xai', senha: '123456', status: 'rejeitado'
    }
];
let atividadesRecentes = JSON.parse(localStorage.getItem('atividadesRecentes')) || [];

function saveData() {
    localStorage.setItem('empresas', JSON.stringify(empresas));
    localStorage.setItem('locaisTrabalho', JSON.stringify(locaisTrabalho));
    localStorage.setItem('profissoes', JSON.stringify(profissoes));
    localStorage.setItem('funcionarios', JSON.stringify(funcionarios));
    localStorage.setItem('atividadesRecentes', JSON.stringify(atividadesRecentes));
}

// DOM Elementos
const authScreen = document.getElementById('auth-screen');
const dashboardScreen = document.getElementById('dashboard-screen');
const loginForm = document.getElementById('login-form');
const registerForm = document.getElementById('register-form');
const showRegisterLink = document.getElementById('show-register');
const showLoginLink = document.getElementById('show-login');
const loginBtn = document.getElementById('login-btn');
const registerBtn = document.getElementById('register-btn');
const logoutBtn = document.getElementById('logout-btn');
const filtroStatus = document.getElementById('filtro-status');
const loggedInUserSpan = document.getElementById('logged-in-user');

// Navegação do formulário de autenticação
showRegisterLink.addEventListener('click', (e) => {
    e.preventDefault();
    loginForm.classList.add('hidden');
    registerForm.classList.remove('hidden');
});

showLoginLink.addEventListener('click', (e) => {
    e.preventDefault();
    registerForm.classList.add('hidden');
    loginForm.classList.remove('hidden');
});

// Login simulation
loginBtn.addEventListener('click', () => {
    const empresaId = document.getElementById('login-empresa-id').value;
    const senha = document.getElementById('login-senha').value;

    const empresaEncontrada = empresas.find(emp => emp.id === empresaId && emp.senha === senha);

    if (empresaEncontrada) {
        localStorage.setItem('empresaLogada', JSON.stringify(empresaEncontrada));
        loggedInUserSpan.textContent = empresaEncontrada.nome;
        authScreen.classList.add('hidden');
        dashboardScreen.classList.remove('hidden');
        atualizarContadores();
        atualizarTabelaLocais();
        atualizarTabelaProfissoes();
        atualizarTabelaFuncionarios();
        atualizarSelectProfissoes();
        atualizarAtividadeRecente();
    } else {
        alert('ID da Empresa ou Senha incorretos.');
    }
});

// Simulação de registro
registerBtn.addEventListener('click', (e) => {
    e.preventDefault();
    const nome = document.getElementById('reg-empresa-nome').value;
    const email = document.getElementById('reg-empresa-email').value;
    const telefone = document.getElementById('reg-empresa-telefone').value;
    const senha = document.getElementById('reg-empresa-senha').value;
    const senhaConfirm = document.getElementById('reg-empresa-senha-confirm').value;

    if (nome && email && telefone && senha && senhaConfirm) {
        if (senha !== senhaConfirm) {
            alert('As senhas não coincidem.');
            return;
        }

        const newId = (empresas.length > 0 ? Math.max(...empresas.map(e => parseInt(e.id))) : 0) + 1;
        const novaEmpresa = {
            id: String(newId), nome, email, telefone, senha
        };
        empresas.push(novaEmpresa);
        saveData();

        localStorage.setItem('empresaLogada', JSON.stringify(novaEmpresa));
        loggedInUserSpan.textContent = novaEmpresa.nome;

        authScreen.classList.add('hidden');
        dashboardScreen.classList.remove('hidden');
        atualizarContadores();
        atualizarTabelaLocais();
        atualizarTabelaProfissoes();
        atualizarTabelaFuncionarios();
        atualizarSelectProfissoes();
        atualizarAtividadeRecente();
        adicionarAtividade('Empresa', `Empresa ${nome} registrada.`);
    } else {
        alert('Por favor, preencha todos os campos obrigatórios.');
    }
});

// Logout
logoutBtn.addEventListener('click', () => {
    localStorage.removeItem('empresaLogada');
    dashboardScreen.classList.add('hidden');
    authScreen.classList.remove('hidden');
    loginForm.classList.remove('hidden');
    registerForm.classList.add('hidden');
    document.getElementById('login-empresa-id').value = '';
    document.getElementById('login-senha').value = '';
});

// Navegação no painel
const navLinks = document.querySelectorAll('.nav-link');
const dashboardContents = document.querySelectorAll('.dashboard-content');

navLinks.forEach(link => {
    link.addEventListener('click', (e) => {
        e.preventDefault();
        navLinks.forEach(l => l.classList.remove('active', 'bg-blue-800'));
        link.classList.add('active', 'bg-blue-800');

        dashboardContents.forEach(content => {
            content.classList.add('hidden');
        });
        const targetId = link.getAttribute('data-target');
        document.getElementById(targetId).classList.remove('hidden');
    });
});

// Funções para gerenciar locais de trabalho
const addLocalBtn = document.getElementById('add-local-btn');
const localModal = document.getElementById('local-modal');
const localForm = document.getElementById('local-form');
const localCancel = document.getElementById('local-cancel');

addLocalBtn.addEventListener('click', () => {
    document.getElementById('local-modal-title').textContent = 'Adicionar Local de Trabalho';
    document.getElementById('local-id').value = '';
    document.getElementById('local-nome').value = '';
    document.getElementById('local-provincia').value = '';
    document.getElementById('local-distrito').value = '';
    localModal.classList.remove('hidden');
});

localCancel.addEventListener('click', () => {
    localModal.classList.add('hidden');
});

localForm.addEventListener('submit', (e) => {
    e.preventDefault();
    const id = document.getElementById('local-id').value;
    const nome = document.getElementById('local-nome').value;
    const provincia = document.getElementById('local-provincia').value;
    const distrito = document.getElementById('local-distrito').value;

    if (nome && provincia && distrito) {
        if (id) {
            const index = locaisTrabalho.findIndex(local => local.id == id);
            if (index !== -1) { 
                locaisTrabalho[index] = { id: parseInt(id), nome, provincia, distrito };
                adicionarAtividade('Local de Trabalho', `Local ${nome} atualizado.`);
            }
        } else {
            const novoId = locaisTrabalho.length > 0 ? Math.max(...locaisTrabalho.map(l => l.id)) + 1 : 1;
            locaisTrabalho.push({ id: novoId, nome, provincia, distrito });
            adicionarAtividade('Local de Trabalho', `Novo local ${nome} adicionado.`);
        }
        saveData();
        atualizarTabelaLocais();
        localModal.classList.add('hidden');
        atualizarContadores();
    } else {
        alert('Por favor, preencha todos os campos.');
    }
});

function atualizarTabelaLocais() {
    const tbody = document.getElementById('locais-table-body');
    tbody.innerHTML = '';
    locaisTrabalho.forEach(local => {
        const tr = document.createElement('tr');
        tr.innerHTML = `
            <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">${local.id}</td>
            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">${local.nome}</td>
            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">${local.provincia}</td>
            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">${local.distrito}</td>
            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                <button class="text-blue-600 hover:text-blue-900 mr-3 editar-local" data-id="${local.id}">Editar</button>
                <button class="text-red-600 hover:text-red-900 excluir-local" data-id="${local.id}">Excluir</button>
            </td>
        `;
        tbody.appendChild(tr);
    });

    document.querySelectorAll('.editar-local').forEach(btn => {
        btn.addEventListener('click', () => {
            const id = btn.getAttribute('data-id');
            const local = locaisTrabalho.find(l => l.id == id);
            if (local) {
                document.getElementById('local-modal-title').textContent = 'Editar Local de Trabalho';
                document.getElementById('local-id').value = local.id;
                document.getElementById('local-nome').value = local.nome;
                document.getElementById('local-provincia').value = local.provincia;
                document.getElementById('local-distrito').value = local.distrito;
                localModal.classList.remove('hidden');
            }
        });
    });

    document.querySelectorAll('.excluir-local').forEach(btn => {
        btn.addEventListener('click', () => {
            const id = btn.getAttribute('data-id');
            mostrarConfirmacao(
                'Excluir Local de Trabalho',
                'Tem certeza que deseja excluir este local?',
                () => {
                    const index = locaisTrabalho.findIndex(l => l.id == id);
                    if (index !== -1) { 
                        const localExcluido = locaisTrabalho[index];
                        locaisTrabalho.splice(index, 1);
                        saveData();
                        atualizarTabelaLocais();
                        atualizarContadores();
                        adicionarAtividade('Local de Trabalho', `Local ${localExcluido.nome} excluído.`);
                    }
                }
            );
        });
    });
}

// Funções para gerir profissões
const addProfissaoBtn = document.getElementById('add-profissao-btn');
const profissaoModal = document.getElementById('profissao-modal');
const profissaoForm = document.getElementById('profissao-form');
const profissaoCancel = document.getElementById('profissao-cancel');

addProfissaoBtn.addEventListener('click', () => {
    document.getElementById('profissao-modal-title').textContent = 'Adicionar Profissão';
    document.getElementById('profissao-id').value = '';
    document.getElementById('profissao-nome').value = '';
    document.getElementById('profissao-descricao').value = '';
    profissaoModal.classList.remove('hidden');
});

profissaoCancel.addEventListener('click', () => {
    profissaoModal.classList.add('hidden');
});

profissaoForm.addEventListener('submit', (e) => {
    e.preventDefault();
    const id = document.getElementById('profissao-id').value;
    const nome = document.getElementById('profissao-nome').value;
    const descricao = document.getElementById('profissao-descricao').value;

    if (nome) {
        if (id) {
            const index = profissoes.findIndex(prof => prof.id == id);
            if (index !== -1) { 
                profissoes[index] = { id: parseInt(id), nome, descricao };
                adicionarAtividade('Profissão', `Profissão ${nome} atualizada.`);
            }
        } else {
            const novoId = profissoes.length > 0 ? Math.max(...profissoes.map(p => p.id)) + 1 : 1;
            profissoes.push({ id: novoId, nome, descricao });
            adicionarAtividade('Profissão', `Nova profissão ${nome} adicionada.`);
        }
        saveData();
        atualizarTabelaProfissoes();
        profissaoModal.classList.add('hidden');
        atualizarContadores();
        atualizarSelectProfissoes();
    } else {
        alert('Por favor, preencha o nome da profissão.');
    }
});

function atualizarTabelaProfissoes() {
    const tbody = document.getElementById('profissoes-table-body');
    tbody.innerHTML = '';
    profissoes.forEach(profissao => {
        const tr = document.createElement('tr');
        tr.innerHTML = `
            <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">${profissao.id}</td>
            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">${profissao.nome}</td>
            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">${profissao.descricao || '-'}</td>
            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                <button class="text-blue-600 hover:text-blue-900 mr-3 editar-profissao" data-id="${profissao.id}">Editar</button>
                <button class="text-red-600 hover:text-red-900 excluir-profissao" data-id="${profissao.id}">Excluir</button>
            </td>
        `;
        tbody.appendChild(tr);
    });

    document.querySelectorAll('.editar-profissao').forEach(btn => {
        btn.addEventListener('click', () => {
            const id = btn.getAttribute('data-id');
            const profissao = profissoes.find(p => p.id == id);
            if (profissao) {
                document.getElementById('profissao-modal-title').textContent = 'Editar Profissão';
                document.getElementById('profissao-id').value = profissao.id;
                document.getElementById('profissao-nome').value = profissao.nome;
                document.getElementById('profissao-descricao').value = profissao.descricao || '';
                profissaoModal.classList.remove('hidden');
            }
        });
    });

    document.querySelectorAll('.excluir-profissao').forEach(btn => {
        btn.addEventListener('click', () => {
            const id = btn.getAttribute('data-id');
            mostrarConfirmacao(
                'Excluir Profissão',
                'Tem certeza que deseja excluir esta profissão?',
                () => {
                    const index = profissoes.findIndex(p => p.id == id);
                    if (index !== -1) { 
                        const profissaoExcluida = profissoes[index];
                        profissoes.splice(index, 1);
                        saveData();
                        atualizarTabelaProfissoes();
                        atualizarContadores();
                        atualizarSelectProfissoes();
                        adicionarAtividade('Profissão', `Profissão ${profissaoExcluida.nome} excluída.`);
                    }
                }
            );
        });
    });
}

//Funções para gerir funcionários
const addFuncionarioBtn = document.getElementById('add-funcionario-btn');
const funcionarioModal = document.getElementById('funcionario-modal');
const funcionarioForm = document.getElementById('funcionario-form');
const funcionarioCancel = document.getElementById('funcionario-cancel');
const confirmacaoModal = document.getElementById('confirmacao-modal');
const confirmacaoTitulo = document.getElementById('confirmacao-titulo');
const confirmacaoMensagem = document.getElementById('confirmacao-mensagem');
const confirmacaoCancelar = document.getElementById('confirmacao-cancelar');
const confirmacaoConfirmar = document.getElementById('confirmacao-confirmar');

// Filtro de status
filtroStatus.addEventListener('change', () => {
    atualizarTabelaFuncionarios();
});

addFuncionarioBtn.addEventListener('click', () => {
    document.getElementById('funcionario-modal-title').textContent = 'Adicionar Funcionário';
    document.getElementById('funcionario-id').value = '';
    document.getElementById('funcionario-nome').value = '';
    document.getElementById('funcionario-email').value = '';
    document.getElementById('funcionario-celular').value = '';
    document.getElementById('funcionario-profissao').value = '';
    document.getElementById('funcionario-provincia').value = '';
    document.getElementById('funcionario-distrito').value = '';
    document.getElementById('funcionario-senha').value = '';
    document.getElementById('funcionario-status').value = 'pendente';
    funcionarioModal.classList.remove('hidden');
});

funcionarioCancel.addEventListener('click', () => {
    funcionarioModal.classList.add('hidden');
});

funcionarioForm.addEventListener('submit', (e) => {
    e.preventDefault();
    const id = document.getElementById('funcionario-id').value;
    const nome = document.getElementById('funcionario-nome').value;
    const email = document.getElementById('funcionario-email').value;
    const celular = document.getElementById('funcionario-celular').value;
    const profissao = document.getElementById('funcionario-profissao').value;
    const provincia = document.getElementById('funcionario-provincia').value;
    const distrito = document.getElementById('funcionario-distrito').value;
    const senha = document.getElementById('funcionario-senha').value;
    const status = document.getElementById('funcionario-status').value;

    const empresaLogada = JSON.parse(localStorage.getItem('empresaLogada'));
    const empresa = empresaLogada ? empresaLogada.nome : 'Empresa Desconhecida'; // Default - se nenhuma empresa estiver conectada

    if (nome && email && profissao && provincia && distrito) {
        if (id) {
            const index = funcionarios.findIndex(func => func.id == id);
            if (index !== -1) { 
                const statusAnterior = funcionarios[index].status;
                funcionarios[index] = {
                    id: parseInt(id),
                    nome, email, celular, empresa, profissao, provincia, distrito,
                    senha: senha || funcionarios[index].senha, // Manter a senha antiga se a nova estiver vazia
                    status
                };
                if (statusAnterior !== status) {
                    adicionarAtividade('Funcionário', `Status do funcionário ${nome} alterado para ${status}.`);
                } else {
                    adicionarAtividade('Funcionário', `Funcionário ${nome} atualizado.`);
                }
            }
        } else {
            const novoId = funcionarios.length > 0 ? Math.max(...funcionarios.map(f => f.id)) + 1 : 1;
            funcionarios.push({
                id: novoId, nome, email, celular, empresa, profissao, provincia, distrito, senha, status
            });
            adicionarAtividade('Funcionário', `Novo funcionário ${nome} adicionado.`);
        }
        saveData();
        atualizarTabelaFuncionarios();
        funcionarioModal.classList.add('hidden');
        atualizarContadores();
    } else {
        alert('Por favor, preencha todos os campos obrigatórios.');
    }
});

function atualizarTabelaFuncionarios() {
    const tbody = document.getElementById('funcionarios-table-body');
    tbody.innerHTML = '';
    const filtro = filtroStatus.value;
    const funcionariosFiltrados = filtro === 'todos' ?
        funcionarios :
        funcionarios.filter(f => f.status === filtro);

    funcionariosFiltrados.forEach(funcionario => {
        const tr = document.createElement('tr');
        let statusClass = '';
        let statusText = '';
        switch (funcionario.status) {
            case 'pendente':
                statusClass = 'status-pendente';
                statusText = 'Pendente';
                break;
            case 'aprovado':
                statusClass = 'status-aprovado';
                statusText = 'Aprovado';
                break;
            case 'rejeitado':
                statusClass = 'status-rejeitado';
                statusText = 'Rejeitado';
                break;
        }

        let botoesAcao = '';
        if (funcionario.status === 'pendente') {
            botoesAcao = `
                <button class="text-green-600 hover:text-green-900 mr-2 aprovar-funcionario" data-id="${funcionario.id}">Aprovar</button>
                <button class="text-red-600 hover:text-red-900 mr-2 rejeitar-funcionario" data-id="${funcionario.id}">Rejeitar</button>
                <button class="text-blue-600 hover:text-blue-900 editar-funcionario" data-id="${funcionario.id}">Editar</button>
            `;
        } else {
            botoesAcao = `
                <button class="text-blue-600 hover:text-blue-900 mr-2 editar-funcionario" data-id="${funcionario.id}">Editar</button>
                <button class="text-red-600 hover:text-red-900 excluir-funcionario" data-id="${funcionario.id}">Excluir</button>
            `;
        }

        tr.innerHTML = `
            <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">${funcionario.id}</td>
            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">${funcionario.nome}</td>
            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">${funcionario.email}</td>
            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">${funcionario.celular || '-'}</td>
            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">${funcionario.profissao}</td>
            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">${funcionario.provincia}</td>
            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">${funcionario.distrito}</td>
            <td class="px-6 py-4 whitespace-nowrap">
                <span class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full ${statusClass}">
                    ${statusText}
                </span>
            </td>
            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                ${botoesAcao}
            </td>
        `;
        tbody.appendChild(tr);
    });

    document.querySelectorAll('.editar-funcionario').forEach(btn => {
        btn.addEventListener('click', () => {
            const id = btn.getAttribute('data-id');
            const funcionario = funcionarios.find(f => f.id == id);
            if (funcionario) {
                document.getElementById('funcionario-modal-title').textContent = 'Editar Funcionário';
                document.getElementById('funcionario-id').value = funcionario.id;
                document.getElementById('funcionario-nome').value = funcionario.nome;
                document.getElementById('funcionario-email').value = funcionario.email;
                document.getElementById('funcionario-celular').value = funcionario.celular || '';
                document.getElementById('funcionario-profissao').value = funcionario.profissao;
                document.getElementById('funcionario-provincia').value = funcionario.provincia;
                document.getElementById('funcionario-distrito').value = funcionario.distrito;
                document.getElementById('funcionario-senha').value = ''; // Não preencha a senha previamente por motivos de segurança
                document.getElementById('funcionario-status').value = funcionario.status;
                funcionarioModal.classList.remove('hidden');
            }
        });
    });

    document.querySelectorAll('.excluir-funcionario').forEach(btn => {
        btn.addEventListener('click', () => {
            const id = btn.getAttribute('data-id');
            mostrarConfirmacao(
                'Excluir Funcionário',
                'Tem certeza que deseja excluir este funcionário?',
                () => {
                    const index = funcionarios.findIndex(f => f.id == id);
                    if (index !== -1) { 
                        const funcionarioExcluido = funcionarios[index];
                        funcionarios.splice(index, 1);
                        saveData();
                        atualizarTabelaFuncionarios();
                        atualizarContadores();
                        adicionarAtividade('Funcionário', `Funcionário ${funcionarioExcluido.nome} excluído.`);
                    }
                }
            );
        });
    });

    document.querySelectorAll('.aprovar-funcionario').forEach(btn => {
        btn.addEventListener('click', () => {
            const id = btn.getAttribute('data-id');
            mostrarConfirmacao(
                'Aprovar Funcionário',
                'Tem certeza que deseja aprovar este funcionário?',
                () => {
                    const index = funcionarios.findIndex(f => f.id == id);
                    if (index !== -1) { 
                        const funcionario = funcionarios[index];
                        funcionario.status = 'aprovado';
                        saveData();
                        atualizarTabelaFuncionarios();
                        atualizarContadores();
                        adicionarAtividade('Funcionário', `Funcionário ${funcionario.nome} aprovado.`);
                    }
                }
            );
        });
    });

    document.querySelectorAll('.rejeitar-funcionario').forEach(btn => {
        btn.addEventListener('click', () => {
            const id = btn.getAttribute('data-id');
            mostrarConfirmacao(
                'Rejeitar Funcionário',
                'Tem certeza que deseja rejeitar este funcionário?',
                () => {
                    const index = funcionarios.findIndex(f => f.id == id);
                    if (index !== -1) { 
                        const funcionario = funcionarios[index];
                        funcionario.status = 'rejeitado';
                        saveData();
                        atualizarTabelaFuncionarios();
                        atualizarContadores();
                        adicionarAtividade('Funcionário', `Funcionário ${funcionario.nome} rejeitado.`);
                    }
                }
            );
        });
    });
}

// Função para mostrar modal de confirmação
function mostrarConfirmacao(titulo, mensagem, callback) {
    confirmacaoTitulo.textContent = titulo;
    confirmacaoMensagem.textContent = mensagem;

    const oldConfirmar = confirmacaoConfirmar;
    const newConfirmar = oldConfirmar.cloneNode(true);
    oldConfirmar.parentNode.replaceChild(newConfirmar, oldConfirmar);

    newConfirmar.addEventListener('click', () => {
        callback();
        confirmacaoModal.classList.add('hidden');
    });

    confirmacaoCancelar.addEventListener('click', () => {
        confirmacaoModal.classList.add('hidden');
    });
    confirmacaoModal.classList.remove('hidden');
}

// Atualizar contadores do painel
function atualizarContadores() {
    document.getElementById('total-funcionarios').textContent = funcionarios.length;
    document.getElementById('total-locais').textContent = locaisTrabalho.length;
    document.getElementById('total-profissoes').textContent = profissoes.length;

    const pendentes = funcionarios.filter(f => f.status === 'pendente').length;
    const aprovados = funcionarios.filter(f => f.status === 'aprovado').length;
    const rejeitados = funcionarios.filter(f => f.status === 'rejeitado').length;

    document.getElementById('total-pendentes').textContent = pendentes;
    document.getElementById('total-aprovados').textContent = aprovados;
    document.getElementById('total-rejeitados').textContent = rejeitados;
}

// Atualizar profissões selecionar menu suspenso
function atualizarSelectProfissoes() {
    const select = document.getElementById('funcionario-profissao');
    select.innerHTML = '<option value="">Selecione uma profissão</option>';
    profissoes.forEach(profissao => {
        const option = document.createElement('option');
        option.value = profissao.nome;
        option.textContent = profissao.nome;
        select.appendChild(option);
    });
}

// Adicionar atividade recente
function adicionarAtividade(tipo, descricao) {
    const agora = new Date();
    const dataFormatada = `${agora.getDate().toString().padStart(2, '0')}/${(agora.getMonth() + 1).toString().padStart(2, '0')}/${agora.getFullYear()} ${agora.getHours().toString().padStart(2, '0')}:${agora.getMinutes().toString().padStart(2, '0')}`;
    atividadesRecentes.unshift({ tipo, descricao, data: dataFormatada }); // Adicionar ao início
    if (atividadesRecentes.length > 10) {
        atividadesRecentes.pop(); // Mantenha apenas os 10 mais recentes
    }
    saveData();
    atualizarAtividadeRecente();
}

function atualizarAtividadeRecente() {
    const tbody = document.getElementById('atividade-recente');
    tbody.innerHTML = '';
    atividadesRecentes.forEach(atividade => {
        const tr = document.createElement('tr');
        tr.innerHTML = `
            <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">${atividade.tipo}</td>
            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">${atividade.descricao}</td>
            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">${atividade.data}</td>
        `;
        tbody.appendChild(tr);
    });
}

// Inicialização
document.addEventListener('DOMContentLoaded', () => {
    const empresaLogada = JSON.parse(localStorage.getItem('empresaLogada'));
    if (empresaLogada) {
        authScreen.classList.add('hidden');
        dashboardScreen.classList.remove('hidden');
        loggedInUserSpan.textContent = empresaLogada.nome;
        atualizarTabelaLocais();
        atualizarTabelaProfissoes();
        atualizarTabelaFuncionarios();
        atualizarContadores();
        atualizarSelectProfissoes();
        atualizarAtividadeRecente();
    } else {
        authScreen.classList.remove('hidden');
        dashboardScreen.classList.add('hidden');
    }

    // Garanta que o conteúdo inicial do painel seja exibido corretamente
    const initialNavLink = document.querySelector('.nav-link[data-target="dashboard-home"]');
    if (initialNavLink) {
        initialNavLink.click();
    }
});

