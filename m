From: Joerg Roedel <joerg.roedel@amd.com>
Subject: Re: [PATCH v7 0/2] iommu/exynos: Add IOMMU/System MMU driver for
 Samsung Exynos
Date: Tue, 6 Dec 2011 13:57:39 +0100
Message-ID: <20111206125739.GK25178@amd.com>
References: <1321609650-1329-1-git-send-email-pullip.cho@samsung.com>
 <20111205154715.GE25178@amd.com>
 <CAH9JG2VALcm-PreS7S2SZPPgEbid_6_VWJA0PHBEtY5KvaA3Og@mail.gmail.com>
 <CAHQjnOOCHO3eDiUft4WgS=8N5EheWas+n3MD9xxBKUoSjmNQSQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from va3ehsobe001.messaging.microsoft.com ([216.32.180.11]:37331
	"EHLO VA3EHSOBE008.bigfish.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1752266Ab1LFM5u (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 6 Dec 2011 07:57:50 -0500
Content-Disposition: inline
In-Reply-To: <CAHQjnOOCHO3eDiUft4WgS=8N5EheWas+n3MD9xxBKUoSjmNQSQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: KyongHo Cho <pullip.cho@samsung.com>
Cc: Kyungmin Park <kmpark@infradead.org>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Younglak Kim <younglak1004.kim@samsung.com>, iommu@lists.linux-foundation.org, Kukjin Kim <kgene.kim@samsung.com>, Sanghyun Lee <sanghyun75.lee@samsung.com>, linux-arm-kernel@lists.infradead.org

On Tue, Dec 06, 2011 at 09:13:18PM +0900, KyongHo Cho wrote:
> > BTW, how do you test it at mainline kernel?
> >
> I merged IOMMU mainline branch to our kernel branch and tested it with
> our FIMC, MFC, JPEG, 2D.

This is not sufficient. Please do it the other way around, merge your
outstanding changes into the mainline kernel (or for iommu topics my
next branch) and test against that. This way it is easier to catch bugs
in mainline.


	Joerg

-- 
AMD Operating System Research Center

Advanced Micro Devices GmbH Einsteinring 24 85609 Dornach
General Managers: Alberto Bozzo, Andrew Bowd
Registration: Dornach, Landkr. Muenchen; Registerger. Muenchen, HRB Nr. 43632
