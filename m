From: Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [PATCH v7 11/44] [media] media: use entity.graph_obj.mdev instead
 of .parent
Date: Tue, 25 Aug 2015 08:36:56 +0200
Message-ID: <55DC0D08.10504@xs4all.nl>
References: <cover.1440359643.git.mchehab@osg.samsung.com> <dc1be98277c46ddd87e431148fc7e332176828ab.1440359643.git.mchehab@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <dc1be98277c46ddd87e431148fc7e332176828ab.1440359643.git.mchehab@osg.samsung.com>
Sender: linux-sh-owner@vger.kernel.org
To: Mauro Carvalho Chehab <mchehab@osg.samsung.com>, Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Javier Martinez Canillas <javier@osg.samsung.com>, Mauro Carvalho Chehab <mchehab@infradead.org>, Kyungmin Park <kyungmin.park@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hyun Kwon <hyun.kwon@xilinx.com>, Michal Simek <michal.simek@xilinx.com>, =?windows-1252?Q?S=F6ren_Brink?= =?windows-1252?Q?mann?= <soren.brinkmann@xilinx.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Prabhakar Lad <prabhakar.csengg@gmail.com>, Hans Verkuil <hans.verkuil@cisco.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-sh@vger.kernel.org, devel@driverdev.osuosl.org
List-Id: linux-samsung-soc@vger.kernel.org

On 08/23/2015 10:17 PM, Mauro Carvalho Chehab wrote:
> From: Javier Martinez Canillas <javier@osg.samsung.com>
> 
> The struct media_entity has a .parent field that stores a pointer
> to the parent struct media_device. But recently a media_gobj was
> embedded into the entities and since struct media_gojb already has
> a pointer to a struct media_device in the .mdev field, the .parent
> field becomes redundant and can be removed.
> 
> This patch replaces all the usage of .parent by .graph_obj.mdev so
> that field will become unused and can be removed on a later patch.
> 
> No functional changes.
> 
> The transformation was made using the following coccinelle spatch:
> 
> @@
> struct media_entity *me;
> @@
> 
> - me->parent
> + me->graph_obj.mdev
> 
> @@
> struct media_entity *link;
> @@
> 
> - link->source->entity->parent
> + link->source->entity->graph_obj.mdev
> 
> @@
> struct exynos_video_entity *ve;
> @@
> 
> - ve->vdev.entity.parent
> + ve->vdev.entity.graph_obj.mdev
> 
> Suggested-by: Mauro Carvalho Chehab <mchehab@osg.samsung.com>
> 
> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
> Signed-off-by: Mauro Carvalho Chehab <mchehab@osg.samsung.com>

Acked-by: Hans Verkuil <hans.verkuil@cisco.com>
