From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: Re: [PATCH v8 10/55] [media] media: rename the function that create
 pad links
Date: Thu, 10 Sep 2015 16:16:10 +0200
Message-ID: <CABxcv=mdyshSH5wzRRJHnhiavr_m74=Ax07=JzSTO1uxiCmJtA@mail.gmail.com>
References: <cover.1440902901.git.mchehab@osg.samsung.com>
	<06bad8b26ee0cef02d9c52d578af3a51a0f03b1f.1440902901.git.mchehab@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <06bad8b26ee0cef02d9c52d578af3a51a0f03b1f.1440902901.git.mchehab@osg.samsung.com>
Sender: linux-doc-owner@vger.kernel.org
To: Mauro Carvalho Chehab <mchehab@osg.samsung.com>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@infradead.org>, Jonathan Corbet <corbet@lwn.net>, Kyungmin Park <kyungmin.park@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Sakari Ailus <sakari.ailus@iki.fi>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hyun Kwon <hyun.kwon@xilinx.com>, Michal Simek <michal.simek@xilinx.com>, =?UTF-8?Q?S=C3=B6ren_Brinkmann?= <soren.brinkmann@xilinx.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hans Verkuil <hans.verkuil@cisco.com>, =?UTF-8?Q?Rafael_Louren=C3=A7o_de_Lima_Chehab?= <chehabrafael@gmail.com>, Shuah Khan <shuahkh@osg.samsung.com>, Matthias Schwarzott <zzam@gentoo.org>, Antti Palosaari <crope@iki.fi>, Olli Salonen <olli.salonen@iki.fi>T
List-Id: linux-samsung-soc@vger.kernel.org

On Sun, Aug 30, 2015 at 5:06 AM, Mauro Carvalho Chehab
<mchehab@osg.samsung.com> wrote:
> With the new API, a link can be either between two PADs or between an interface
> and an entity. So, we need to use a better name for the function that create
> links between two pads.
>
> So, rename the such function to media_create_pad_link().
>
> No functional changes.
>
> This patch was created via this shell script:
>         for i in $(find drivers/media -name '*.[ch]' -type f) $(find drivers/staging/media -name '*.[ch]' -type f) $(find include/ -name '*.h' -type f) ; do sed s,media_entity_create_link,media_create_pad_link,g <$i >a && mv a $i; done
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab@osg.samsung.com>
> Acked-by: Hans Verkuil <hans.verkuil@cisco.com>
> Signed-off-by: Mauro Carvalho Chehab <mchehab@osg.samsung.com>
>

Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>
Tested-by: Javier Martinez Canillas <javier@osg.samsung.com>

Best regards,
Javier
