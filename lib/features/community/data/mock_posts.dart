import '../domain/community_post.dart';

const mockPosts = [
  CommunityPost(
    author: 'Usuario1',
    likes: 12,
    content: 'Mi experiencia comprando en Temu: llego en 12 dias, revisado por aduana sin impuestos.',
    tags: ['Temu', 'Envio', 'Ecuador'],
  ),
  CommunityPost(
    author: 'Usuario2',
    likes: 5,
    content: 'En AliExpress me llego en 20 dias, aduana pidio factura, sin impuestos.',
    tags: ['AliExpress', 'Factura', 'Aduana'],
  ),
  CommunityPost(
    author: 'Usuario3',
    likes: 18,
    content: 'Amazon con courier privado: 8 dias puerta a puerta, pague IVA al courier.',
    tags: ['Amazon', 'Courier', 'IVA'],
  ),
];
