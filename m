From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH 0/8] DMA: s3c64xx: Conversion to the new channel request API
Date: Wed, 16 Nov 2016 13:58:28 +0100
Message-ID: <80c362ab-5b37-dc0e-7b45-db0d51adcb13@samsung.com>
References: <1478791076-19528-1-git-send-email-s.nawrocki@samsung.com>
 <CGME20161116031720epcas2p2f0c9017fe5e256a2d69f076af2a3f308@epcas2p2.samsung.com>
 <20161116032620.GV3000@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:15071 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752279AbcKPM6e (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 16 Nov 2016 07:58:34 -0500
In-reply-to: <20161116032620.GV3000@localhost>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vinod Koul <vinod.koul@intel.com>, arnd@arndb.de, krzk@kernel.org
Cc: kgene@kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org, broonie@kernel.org, ckeepax@opensource.wolfsonmicro.com, ym0914@gmail.com, javier@osg.samsung.com, andi.shyti@samsung.com, sbkim73@samsung.com

On 11/16/2016 04:26 AM, Vinod Koul wrote:
> On Thu, Nov 10, 2016 at 04:17:48PM +0100, Sylwester Nawrocki wrote:
>> This patch series aims to convert the s3c64xx platform to use
>> the new DMA channel request API, i.e. this is only meaningful 
>> for non-dt systems using s3c64xx SoCs.
>>
>> Presumably the first 2 or 4 patches in this series could be queued 
>> for v4.10-rc1 and the remaining patches could be left for subsequent
>> release, to avoid non-trivial conflict with patches already applied 
>> in the ASoC tree.
> 
> I am fine with dma patch (expect the subsystem tag) and others except arm
> ones have acks, so I think we can merge this for v4.10-rc1. I cna create a
> immutable tag and people can merge into their tree in case they have
> dependencies.
> 
> Btw need acks on ARM patches before I can apply

Great, then we an Ack for these 2 patches:

ARM: s3c64xx: Add DMA slave maps for PL080 devices
ARM: s3c64xx: Drop unused DMA fields from struct s3c64xx_spi_csinfo

-- 
Thanks,
Sylwester
