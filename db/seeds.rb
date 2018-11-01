#temporary seeds

user = User.last



Userstatistic.create(user:user, date:"2018-02-02", fb_photo_public:4, fb_photo_public_sensitive:1, fb_post_public:5, fb_post_public_sensitive:2, fb_likes_public:2, fb_likes_public_sensitive:1, tw_photo_public:15, tw_photo_public_sensitive:3, tw_post_public:0, tw_post_public_sensitive:0, tw_likes_public:0, tw_likes_public_sensitive:0, total_fb_public:10, total_fb_public_sensitive:3, total_tw_public:12, total_tw_public_sensitive:4)
Userstatistic.create(user:user, date:"2018-04-04", fb_photo_public:4, fb_photo_public_sensitive:1, fb_post_public:5, fb_post_public_sensitive:2, fb_likes_public:2, fb_likes_public_sensitive:1, tw_photo_public:15, tw_photo_public_sensitive:3, tw_post_public:0, tw_post_public_sensitive:0, tw_likes_public:0, tw_likes_public_sensitive:0, total_fb_public:8, total_fb_public_sensitive:1, total_tw_public:9, total_tw_public_sensitive:2)
Userstatistic.create(user:user, date:"2018-09-09", fb_photo_public:4, fb_photo_public_sensitive:1, fb_post_public:5, fb_post_public_sensitive:2, fb_likes_public:2, fb_likes_public_sensitive:1, tw_photo_public:15, tw_photo_public_sensitive:3, tw_post_public:0, tw_post_public_sensitive:0, tw_likes_public:0, tw_likes_public_sensitive:0, total_fb_public:7, total_fb_public_sensitive:0, total_tw_public:10, total_tw_public_sensitive:3)

Content.create(user: user, external_provider: "facebook", external_id: 1, external_created_date: "2018-10-19", external_edit_date: nil, external_deleted_date: nil, file_type: "image", selected: false, coef_total: 0, scan_date: "2018-09-19", url_image: 'https://images.unsplash.com/photo-1493078640264-28e9ec0ae9ae?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=1679b9338ca51be3405097747df3d6cd&auto=format&fit=crop&w=1050&q=80s', text_publication: nil)
Content.create(user: user, external_provider: "facebook", external_id: 2, external_created_date: "2018-10-19", external_edit_date: nil, external_deleted_date: nil, file_type: "post", selected: false, coef_total: 0, scan_date: "2018-09-19", url_image: nil, text_publication: "Lorem ipsum dolor sit amet, bentley adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.u caractères de votre document, que ce soit un curriculum vitae, une brochure, une lettre de candidature, une thèse, un doctorat, un travail de recherchesss," )
Content.create(user: user, external_provider: "facebook", external_id: 3, external_created_date: "2018-10-19", external_edit_date: nil, external_deleted_date: nil, file_type: "like", selected: false, coef_total: 0, scan_date: "2018-09-19",url_image: nil, text_publication: "La Pizzeria")
Content.create(user: user, external_provider: "facebook", external_id: 4, external_created_date: "2018-10-19", external_edit_date: nil, external_deleted_date: nil, file_type: "like", selected: false, coef_total: 17, scan_date: "2018-09-19",url_image: nil, text_publication: "**** ** ****")
Content.create(user: user, external_provider: "facebook", external_id: 5, external_created_date: "2018-10-19", external_edit_date: nil, external_deleted_date: nil, file_type: "post", selected: false, coef_total: 150, scan_date: "2018-09-19",url_image: nil, text_publication: "**** ** **** **** ** **** **** ** ****  **** ** **** **** ** **** **** ** **** **** ** ****")
Content.create(user: user, external_provider: "facebook", external_id: 6, external_created_date: "2018-10-19", external_edit_date: nil, external_deleted_date: nil, file_type: "image", selected: false, coef_total: 10, scan_date: "2018-09-19", url_image: 'https://images.unsplash.com/photo-1513309914637-65c20a5962e1?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=228f272007b6369007faeba1901c3274&auto=format&fit=crop&w=1050&q=80', text_publication: nil)
Content.create(user: user, external_provider: "facebook", external_id: 7, external_created_date: "2018-10-19", external_edit_date: nil, external_deleted_date: nil, file_type: "image", selected: true, coef_total: 0, scan_date: "2018-09-19", url_image: "https://images.unsplash.com/photo-1511840516357-3b60bdcef23b?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=addee11d0f8d95319ea087e49316b8bd&auto=format&fit=crop&w=1050&q=80", text_publication: nil)
Content.create(user: user, external_provider: "facebook", external_id: 8, external_created_date: "2018-10-19", external_edit_date: nil, external_deleted_date: nil, file_type: "image", selected: false, coef_total: 0, scan_date: "2018-09-19", url_image: "https://images.unsplash.com/photo-1531062916849-ac6624741870?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=7d8ff8c523c58f1cee1bb0821b1c4a96&auto=format&fit=crop&w=1050&q=80", text_publication: nil)
Content.create(user: user, external_provider: "facebook", external_id: 9, external_created_date: "2018-10-19", external_edit_date: nil, external_deleted_date: nil, file_type: "image", selected: false, coef_total: 80, scan_date: "2018-09-19", url_image: "https://images.unsplash.com/photo-1536795335207-28f63e2352f0?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=3acbede4c20ecbba834cfd4c25c9ec40&auto=format&fit=crop&w=634&q=80", text_publication: nil)
Content.create(user: user, external_provider: "facebook", external_id: 10, external_created_date: "2018-10-20", external_edit_date: nil, external_deleted_date: nil, file_type: "post", selected: false, coef_total: 0, scan_date: "2018-09-19", url_image: nil, text_publication: "Google Actualités ou Google News est un service en ligne gratuit de Google qui présente de façon automatisée des articles d'information en provenance de sources sur le Web. Il fonctionne de la même manière qu'un moteur de recherche, en n'indexant que les articles de presse.")
Content.create(user: user, external_provider: "facebook", external_id: 3, external_created_date: "2018-10-19", external_edit_date: nil, external_deleted_date: nil, file_type: "like", selected: false, coef_total: 0, scan_date: "2018-09-19",url_image: nil, text_publication: "Chorizo")
Content.create(user: user, external_provider: "facebook", external_id: 3, external_created_date: "2018-10-19", external_edit_date: nil, external_deleted_date: nil, file_type: "like", selected: false, coef_total: 0, scan_date: "2018-09-19",url_image: nil, text_publication: "La Raclette")
Content.create(user: user, external_provider: "facebook", external_id: 3, external_created_date: "2018-10-19", external_edit_date: nil, external_deleted_date: nil, file_type: "like", selected: false, coef_total: 0, scan_date: "2018-09-19",url_image: nil, text_publication: "Kebab <3")
#long-term seeds !!!! DON'T DELETE
#DONT DELETE
#DONT DELETE
#DONT DELETE
#DONT DELETE
#DONT DELETE
#DONT DELETE
#DONT DELETE
#DONT DELETE
#DONT DELETE
#DONT DELETE
#DONT DELETE
#DONT DELETE
#DONT DELETE
#DONT DELETE
#DONT DELETE
#DONT DELETE

Topic.create(name:"Swearing")
Topic.create(name:"Politic")
Topic.create(name:"Sexualy explicit")
Topic.create(name:"Alcool and drugs")
Topic.create(name:"Religion")
Topic.create(name:"Party")

