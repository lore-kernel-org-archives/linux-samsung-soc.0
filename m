From: Kamil Debski <k.debski@samsung.com>
Subject: RE: [PATCH 1/2] s5p-mfc: Update mfc-v6 firmware
Date: Fri, 16 May 2014 12:09:37 +0200
Message-ID: <04bf01cf70ee$f2184d40$d648e7c0$%debski@samsung.com>
References: <1400233490-5677-1-git-send-email-arun.kk@samsung.com>
 <04be01cf70ec$d5f37a10$81da6e30$%debski@samsung.com>
 <CALt3h7_A2TmyoXFBjr7Ncy8560oBT6EOD7nq9qdRtD34O56FdQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:28671 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755828AbaEPKJ1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 16 May 2014 06:09:27 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N5N00KFMW7H9700@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 16 May 2014 11:09:17 +0100 (BST)
In-reply-to: <CALt3h7_A2TmyoXFBjr7Ncy8560oBT6EOD7nq9qdRtD34O56FdQ@mail.gmail.com>
Content-language: pl
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Arun Kumar K' <arun.kk@samsung.com>
Cc: 'dwmw2' <dwmw2@infradead.org>, 'ben' <ben@decadent.org.uk>, 'linux-samsung-soc' <linux-samsung-soc@vger.kernel.org>

Hi,

----Original Message-----
> From: arunkk.samsung@gmail.com [mailto:arunkk.samsung@gmail.com] On
> Behalf Of Arun Kumar K
> Sent: Friday, May 16, 2014 12:00 PM
> 
> Hi Kamil,
> 
> On Fri, May 16, 2014 at 3:24 PM, Kamil Debski <k.debski@samsung.com>
> wrote:
> > Hi Arun,
> >
> > I asked you to put old and new v6 firmware in separate files.
> 
> But wont that require a different filename other than s5p-mfc-v6.fw?

Yes.

> But the driver still expects the same file name.
> Can I put the new filename as s5p-mfc-v6-v2.fw and mention in the
> README that the file has to be renamed to s5p-mfc-v6.fw to be used?

I think this is the way to go, because the new driver (with the patch)
will work with old firmware, while old driver (without the patch) will
not work with the new firmware.

> 
> > You should also mention in the commit message that this new firmware
> > will not work with the s5p-mfc driver without the patch you recently
> > submitted to linux-media mailing list. Please also add a link to the
> > thread with the necessary patch.
> 
> Ok will do that.
> 
> >
> > In addition to the above I think a readme/description file should be
> > added to the s5p-mfc folder. The issue of firmware for v6 should be
> > explained, so that no one is surprised that something does not work.
> >
> 
> Ok.
> 
> Regards
> Arun

Best wishes,
-- 
Kamil Debski
Samsung R&D Institute Poland

> 
> > Best wishes,
> > --
> > Kamil Debski
> > Samsung R&D Institute Poland
> >
> >
> >> -----Original Message-----
> >> From: Arun Kumar K [mailto:arunkk.samsung@gmail.com] On Behalf Of
> >> Arun Kumar K
> >> Sent: Friday, May 16, 2014 11:45 AM
> >> To: dwmw2@infradead.org; ben@decadent.org.uk; linux-samsung-
> >> soc@vger.kernel.org
> >> Cc: k.debski@samsung.com; arunkk.samsung@gmail.com
> >> Subject: [PATCH 1/2] s5p-mfc: Update mfc-v6 firmware
> >>
> >> This is the newer version of s5p-mfc-v6.fw with many fixes and
> >> enhancements.
> >>
> >> Signed-off-by: Arun Kumar K <arun.kk@samsung.com>
> >> ---
> >>  s5p-mfc/s5p-mfc-v6.fw |  Bin 306312 -> 343756 bytes
> >>  1 file changed, 0 insertions(+), 0 deletions(-)
> >>
> >> diff --git a/s5p-mfc/s5p-mfc-v6.fw b/s5p-mfc/s5p-mfc-v6.fw index
> >>
> 2e1179fa6d227f1c5a23f78b4834be336e579f50..9d3345fbf4abb7ea7389816916d
> >> 68
> >> 57d64732380 100644
> >> GIT binary patch
> >> literal 343756
> >
> > [snip]
> >
