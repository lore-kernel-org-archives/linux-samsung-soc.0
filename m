From: Yauhen Kharuzhy <jekhor@gmail.com>
Subject: Re: [PATCH 0/7] ARM: Removing ARCH_S5PC100
Date: Wed, 18 May 2011 12:36:58 +0300
Message-ID: <20110518093658.GA2421@jeknote.loshitsa1.net>
References: <1305162674-25860-1-git-send-email-kgene.kim@samsung.com>
 <20110517121948.GE2737@game.jcrosoft.org>
 <001201cc1537$bfb24e20$3f16ea60$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:59019 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932507Ab1ERJhD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 18 May 2011 05:37:03 -0400
Received: by fxm17 with SMTP id 17so1048978fxm.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 18 May 2011 02:37:02 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <001201cc1537$bfb24e20$3f16ea60$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Jean-Christophe PLAGNIOL-VILLARD' <plagnioj@jcrosoft.com>, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org

On Wed, May 18, 2011 at 05:44:03PM +0900, Kukjin Kim wrote:
> Jean-Christophe PLAGNIOL-VILLARD wrote:
> > 
> > HI,
> > 
> Hi,
> 
> > 	why do you remove it?
> > 
> Thanks for your concerns :)
> 
> I think it's rather premature to decide it at this time.
> So this is dropped at this moment...but as a note, I will implement this
> into other samsung stuff next time :)

I think that we should implement SoC support with more unified way
_before_ removing working code, not after.

> 
> Thanks.
> 
> Best regards,
> Kgene.
> --
> Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
> SW Solution Development Team, Samsung Electronics Co., Ltd.
> 
> > On 10:11 Thu 12 May     , Kukjin Kim wrote:
> > > This patch remvoes mach-s5pc100 directory for ARCH_S5PC100 in arch/arm.
> > >
> > > If any problems, please let me know immediately.
> > >
> > > [PATCH 1/7] ARM: S5PC100: Removing ARCH_S5PC100
> > > [PATCH 2/7] ASoC: Remove to support sound for S5PC100
> > > [PATCH 3/7] [media] s5p-fimc: Remove to support fimc for S5PC100
> > > [PATCH 4/7] mtd: OneNAND: Remove to support onenand for S5PC100
> > > [PATCH 5/7] tty: Remove to support serial for S5PC100
> > > [PATCH 6/7] video: s3c-fb: Remove to support fb for S5PC100
> > > [PATCH 7/7] libata: Remove to support pata for S5PC100
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

-- 
Yauhen Kharuzhy		jekhor _at_ gmail.com
			JID: jek@jabber.ru
			skype: jekhor

A: No
Q: Should I quote below my post?
