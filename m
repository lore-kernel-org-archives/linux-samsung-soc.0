From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: RE: [RFC/PATCH 2/4] [media] s5p-fimc: Porting to videobuf 2
Date: Tue, 07 Dec 2010 10:33:34 +0100
Message-ID: <000001cb95f1$d1499af0$73dcd0d0$%nawrocki@samsung.com>
References: <1291214153-6335-1-git-send-email-s.nawrocki@samsung.com>
 <1291214153-6335-3-git-send-email-s.nawrocki@samsung.com>
 <00e501cb95d5$b2de31f0$189a95d0$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:28372 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755079Ab0LGJdj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 7 Dec 2010 04:33:39 -0500
In-reply-to: <00e501cb95d5$b2de31f0$189a95d0$%han@samsung.com>
Content-language: en-us
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Jonghun Han' <jonghun.han@samsung.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, kyungmin.park@samsung.com, linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org

Hi Jonghun,

> -----Original Message-----
> From: linux-media-owner@vger.kernel.org [mailto:linux-media-
> owner@vger.kernel.org] On Behalf Of Jonghun Han
> Sent: Tuesday, December 07, 2010 7:12 AM
> To: 'Sylwester Nawrocki'; linux-media@vger.kernel.org; linux-samsung-
> soc@vger.kernel.org
> Cc: m.szyprowski@samsung.com; kyungmin.park@samsung.com
> Subject: RE: [RFC/PATCH 2/4] [media] s5p-fimc: Porting to videobuf 2
> 
> 
> Sylwester Nawrocki wrote:
> 
> > -----Original Message-----
> > From: linux-media-owner@vger.kernel.org [mailto:linux-media-
> > owner@vger.kernel.org] On Behalf Of Sylwester Nawrocki
> > Sent: Wednesday, December 01, 2010 11:36 PM
> > To: linux-media@vger.kernel.org; linux-samsung-soc@vger.kernel.org
> > Cc: m.szyprowski@samsung.com; kyungmin.park@samsung.com;
> > s.nawrocki@samsung.com
> > Subject: [RFC/PATCH 2/4] [media] s5p-fimc: Porting to videobuf 2
> >
> > Porting to videobuf 2 and minor cleanup.
> > Separate videobuf_queue_ops are are created for m2m
> > and capture video nodes.
> >
> > Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> > Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> > Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> > ---
> 
> 
> <snip>
> 
> Hi,
> 
> > @@ -968,6 +934,11 @@ static int fimc_m2m_streamon(struct file *file,
> void
> *priv,
> >  			   enum v4l2_buf_type type)
> >  {
> >  	struct fimc_ctx *ctx = priv;
> > +
> > +	/* The source and target color format need to be set */
> > +	if (~ctx->state & (FIMC_DST_FMT | FIMC_SRC_FMT))
> > +		return -EINVAL;
> > +
> >  	return v4l2_m2m_streamon(file, ctx->m2m_ctx, type);
> >  }
> 
> You had better divide a state checking according to v4l2_buf_type to
> make
> easier
> for application to use it. For example application can have two threads
> for handling m2m device. The one is for source control(OUTPUT) and
> the other is for destination control(CAPTURE). If state checking is not
> divided,
> application should consider other thread's state whether VIDIOC_S_FMT
> was
> called or not
> before VIDIOC_STREAMON.
> 
> BRs,

I would rather expect having separate threads for video buffer
queueing/dequeing only and formats configured in main thread. Anyway your
use case can be easily supported as you pointed out, since device_run
callback is called only after VIDIOC_STREAMON was called on both m2m
streams. I will incorporate your comments in the next patch set version.

Thank you,
Sylwester

--
Sylwester Nawrocki
Samsung Poland R&D Center
