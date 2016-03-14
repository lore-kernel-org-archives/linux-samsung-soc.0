From: Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH] media: add GFP flag to media_*() that could get called
 in atomic context
Date: Mon, 14 Mar 2016 09:22:37 +0200
Message-ID: <20160314072236.GO11084@valkosipuli.retiisi.org.uk>
References: <1457833689-4926-1-git-send-email-shuahkh@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1457833689-4926-1-git-send-email-shuahkh@osg.samsung.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Shuah Khan <shuahkh@osg.samsung.com>
Cc: mchehab@osg.samsung.com, kyungmin.park@samsung.com, a.hajda@samsung.com, s.nawrocki@samsung.com, kgene@kernel.org, k.kozlowski@samsung.com, laurent.pinchart@ideasonboard.com, hyun.kwon@xilinx.com, soren.brinkmann@xilinx.com, gregkh@linuxfoundation.org, perex@perex.cz, tiwai@suse.com, hans.verkuil@cisco.com, lixiubo@cmss.chinamobile.com, javier@osg.samsung.com, g.liakhovetski@gmx.de, chehabrafael@gmail.com, crope@iki.fi, tommi.franttila@intel.com, dan.carpenter@oracle.com, prabhakar.csengg@gmail.com, hamohammed.sa@gmail.com, der.herr@hofr.at, navyasri.tech@gmail.com, Julia.Lawall@lip6.fr, amitoj1606@gmail.com, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-renesas-soc@vger.kernel.org, devel@driverdev.osuosl.org, alsa-devel@alsa-project.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi Shuah,

On Sat, Mar 12, 2016 at 06:48:09PM -0700, Shuah Khan wrote:
> Add GFP flags to media_create_pad_link(), media_create_intf_link(),
> media_devnode_create(), and media_add_link() that could get called
> in atomic context to allow callers to pass in the right flags for
> memory allocation.
> 
> tree-wide driver changes for media_*() GFP flags change:
> Change drivers to add gfpflags to interffaces, media_create_pad_link(),
> media_create_intf_link() and media_devnode_create().
> 
> Signed-off-by: Shuah Khan <shuahkh@osg.samsung.com>
> Suggested-by: Mauro Carvalho Chehab <mchehab@osg.samsung.com>

What's the use case for calling the above functions in an atomic context?

-- 
Regards,

Sakari Ailus
e-mail: sakari.ailus@iki.fi	XMPP: sailus@retiisi.org.uk
