From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: Re: s3c2440 / s3c2416 broken
Date: Thu, 10 Nov 2011 08:59:01 +0100
Message-ID: <201111100859.02647.heiko@sntech.de>
References: <CAC=G6syKMJk+L+-_k+T37qHKzfpNz_TrYi-HTaufczLxJKEtkQ@mail.gmail.com> <CAC=G6swbDHZJ7fqu9LoYRiri6bg+M+VDZnG_-=ZfP9r=6YtVeg@mail.gmail.com> <CAJuYYwTQ-eCN1pTkgrthhUEdk5gr9oGGcO6MCKCWQAovsQVqcg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from h1778886.stratoserver.net ([85.214.133.74]:50771 "EHLO
	h1778886.stratoserver.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754905Ab1KJH7K (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 10 Nov 2011 02:59:10 -0500
In-Reply-To: <CAJuYYwTQ-eCN1pTkgrthhUEdk5gr9oGGcO6MCKCWQAovsQVqcg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, Paul Schilling <paul.s.schilling@gmail.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
Cc: Thomas Abraham <thomas.abraham@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>

Hi Paul,

Am Donnerstag, 10. November 2011, 01:14:59 schrieb Thomas Abraham:
> On 10 November 2011 05:00, Paul Schilling <paul.s.schilling@gmail.com> 
wrote:
> > Boot past init slow - stalled when using jffs2 also.
> > 
> > On Wed, Nov 9, 2011 at 4:12 PM, Paul Schilling
> > 
> > <paul.s.schilling@gmail.com> wrote:
> >> Latest kernel 3.2.0-rc1 appears to break the following processors
> >> s3c2440 and s3c2416
> >> 
> >> both appear to stall when init is executed on NFS.  Also I  lost HSMMC
> >> on the s3c2416.
> 
> Could you post a boot log of the kernel on the s3c2440 and s3c2416 boards?

Also, is your out-of-tree kernel code available somewhere? [1]

As my S3C2416 based platform didn't show any problems and has working hsmmc 
with 3.2-rc1 it would be cool to be able to compare both and see if we differ 
somehow.


Heiko


[1] Mine's at https://gitorious.org/oyo-hack/kernel/commits/topic/board/sg060
