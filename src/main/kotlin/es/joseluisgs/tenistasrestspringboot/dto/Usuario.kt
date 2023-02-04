package es.joseluisgs.tenistasrestspringboot.dto

import java.time.LocalDateTime
import java.util.*


data class UsuarioCreateDto(
    val nombre: String,
    val email: String,
    val username: String,
    val avatar: String? = null,
    val rol: String? = "USER",
    val password: String
)

data class UsuarioLoginDto(
    val username: String,
    val password: String
)

data class UsuarioDto(
    val id: UUID? = null,
    val nombre: String,
    val username: String,
    val email: String,
    val avatar: String,
    val rol: String,
    val metadata: MetaData? = null,
) {
    data class MetaData(
        val createdAt: LocalDateTime? = LocalDateTime.now(),
        val updatedAt: LocalDateTime? = LocalDateTime.now(),
        val deleted: Boolean = false
    )
}

data class UserWithTokenDto(
    val user: UsuarioDto,
    val token: String
)



