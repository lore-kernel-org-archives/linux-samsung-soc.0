From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: Re: [PATCH 5/5] [media] media-device: make media_device_cleanup() static
Date: Wed, 16 Mar 2016 11:03:38 -0300
Message-ID: <CABxcv=mvtXBs9qu6+HDbiB4pmMAM9cf=3mPTtLp0XWftRrGM1g@mail.gmail.com>
References: <dba4d41bdfa6bb8dc51cb0f692102919b2b7c8b4.1458129823.git.mchehab@osg.samsung.com>
	<864cdbedcdde600b09d77bfecb1b828e16e41ac0.1458129823.git.mchehab@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <864cdbedcdde600b09d77bfecb1b828e16e41ac0.1458129823.git.mchehab@osg.samsung.com>
Sender: linux-media-owner@vger.kernel.org
To: Mauro Carvalho Chehab <mchehab@osg.samsung.com>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@infradead.org>, Shuah Khan <shuahkh@osg.samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hyun Kwon <hyun.kwon@xilinx.com>, Michal Simek <michal.simek@xilinx.com>, =?UTF-8?Q?S=C3=B6ren_Brinkmann?= <soren.brinkmann@xilinx.com>, Antti Palosaari <crope@iki.fi>, Javier Martinez Canillas <javier@osg.samsung.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Stefan Richter <stefanr@s5r6.in-berlin.de>, Hans Verkuil <hans.verkuil@cisco.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Junghak Sung <jh1009.sung@samsung.com>, Geunyoung Kim <nenggun.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, =?UTF-8?Q?Rafae
List-Id: linux-samsung-soc@vger.kernel.org

Hello Mauro,

The patch looks mostly good to me, I just have a question below:

On Wed, Mar 16, 2016 at 9:04 AM, Mauro Carvalho Chehab
<mchehab@osg.samsung.com> wrote:

[snip]

>
> -void media_device_cleanup(struct media_device *mdev)
> +static void media_device_cleanup(struct media_device *mdev)
>  {
>         ida_destroy(&mdev->entity_internal_idx);
>         mdev->entity_internal_idx_max = 0;
>         media_entity_graph_walk_cleanup(&mdev->pm_count_walk);
> -       mutex_destroy(&mdev->graph_mutex);

Any reason why this is removed? mutex_init() is still called in
media_device_init() so I believe the destroy should be kept here.

Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>

Best regards,
Javier
