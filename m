From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v3 0/6] arm: exynos: add dt based support for exynos5 hdmi
Date: Wed, 17 Oct 2012 20:41:44 +0900
Message-ID: <006301cdac5c$61cdac10$25690430$%kim@samsung.com>
References: <1350343834-23992-1-git-send-email-rahul.sharma@samsung.com>
 <5746364.jIDeNjU3ph@amdc1227>
 <CAPdUM4OtZ3Gh3UKeop8V4n5MVPh=DazJb8-HT+3CUfb79k4r6A@mail.gmail.com>
 <CAH9JG2Wb-xnEJDQuR6jbqrb-VZc6jq4QguU=qRJUiacmaDFZaw@mail.gmail.com>
 <CAPdUM4MuLXi2mj91QWnOLHJj=D=s8nmQ+_rxqqhrt+YAUuVZ1Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:20726 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754373Ab2JQLlq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 17 Oct 2012 07:41:46 -0400
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MC100J8UCHGDOC0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 17 Oct 2012 20:41:44 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.199])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MC1008RVCHKH8A0@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 17 Oct 2012 20:41:44 +0900 (KST)
In-reply-to: <CAPdUM4MuLXi2mj91QWnOLHJj=D=s8nmQ+_rxqqhrt+YAUuVZ1Q@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Rahul Sharma' <r.sh.open@gmail.com>, 'Kyungmin Park' <kyungmin.park@samsung.com>
Cc: 'Rahul Sharma' <rahul.sharma@samsung.com>, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, 'Tomasz Figa' <t.figa@samsung.com>, t.stanislaws@samsung.com, sw0312.kim@samsung.com, inki.dae@samsung.com, jy0922.shim@samsung.com, thomas.ab@samsung.com, prashanth.g@samsung.com, joshi@samsung.com, s.shirish@samsung.com

Rahul Sharma wrote:
> 
> Mr. Park,
> 
> Looks good to me.
> Shall I divide the patch-set into two groups and re-post them?
> 
No, you don't need to divide this series. It should be OK to be sent to
upstream via Samsung tree. But see my small comments on your patch before
that.

BTW, I'm not sure about 6th patch which removes to support non-DT for
exynos4210 in Samsung tree because as you commented on the patch, the
removed code should be replaced by corresponding patch is in exynos drm
driver. So I think, topic branch I will provide for exynos drm tree can be a
way to solve it. Or Kyungmin's suggestion can be a way for it too. Let you
know which one is better...when I pick this up in my tree.

> regards,
> Rahul Sharma.
> 
> On Wed, Oct 17, 2012 at 9:09 AM, Kyungmin Park
> <kyungmin.park@samsung.com> wrote:
> > Hi,
> >
> > It's common case, one topic but two different tree.
> > So I suggest merge it at samsung sub-soc tree and drm parts will be
> > merged after arm-soc tree is merged. since arm-soc tree collect arm
> > soc-soc and merged early at merge window. then drm tree will be merged
> > later.
> > Until that time, drm patches are hold only at local git.
> >
> > How do you think?
> >

Kyungmin, thanks for your suggestion :)

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
