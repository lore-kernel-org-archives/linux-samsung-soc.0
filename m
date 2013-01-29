From: Padma Venkat <padma.kvr@gmail.com>
Subject: Re: [PATCH V6 10/10] dmaengine: Fix compilation error in non-DT case
Date: Tue, 29 Jan 2013 14:23:05 +0530
Message-ID: <CAAgF-BddMcNZs-99Jw=ZhRs9CCO_-eev=b5TW5BR2DS9gM_2Qw@mail.gmail.com>
References: <1358509629-20471-1-git-send-email-padma.v@samsung.com>
	<1358509629-20471-11-git-send-email-padma.v@samsung.com>
	<20130128134726.GV26562@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ia0-f180.google.com ([209.85.210.180]:64648 "EHLO
	mail-ia0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753514Ab3A2IxH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 29 Jan 2013 03:53:07 -0500
Received: by mail-ia0-f180.google.com with SMTP id f27so242244iae.39
        for <linux-samsung-soc@vger.kernel.org>; Tue, 29 Jan 2013 00:53:06 -0800 (PST)
In-Reply-To: <20130128134726.GV26562@intel.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vinod Koul <vinod.koul@intel.com>
Cc: Padmavathi Venna <padma.v@samsung.com>, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org, devicetree-discuss@lists.ozlabs.org, sbkim73@samsung.com, broonie@opensource.wolfsonmicro.com, grant.likely@secretlab.ca, swarren@nvidia.com, boojin.kim@samsung.com, kgene.kim@samsung.com, jassisinghbrar@gmail.com, thomas.abraham@linaro.org, lrg@ti.com, tiwai@suse.de, ben-linux@fluff.org

Hi,

On Mon, Jan 28, 2013 at 7:17 PM, Vinod Koul <vinod.koul@intel.com> wrote:
> On Fri, Jan 18, 2013 at 05:17:09PM +0530, Padmavathi Venna wrote:
>> Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
>> ---
>>  include/linux/dmaengine.h |    2 +-
>>  1 files changed, 1 insertions(+), 1 deletions(-)
>>
>> diff --git a/include/linux/dmaengine.h b/include/linux/dmaengine.h
>> index 8cd0e25..c88f302 100644
>> --- a/include/linux/dmaengine.h
>> +++ b/include/linux/dmaengine.h
>> @@ -992,7 +992,7 @@ static inline struct dma_chan *__dma_request_channel(dma_cap_mask_t *mask,
>>  static inline struct dma_chan *dma_request_slave_channel(struct device *dev,
>>                                                        char *name)
>>  {
>> -     return NULL
>> +     return NULL;
> what tree was this generated against? this was fixed by 678bd8

I generated against Kukjin for-next branch. I just noticed that it's
fixed in your next branch. I will drop this patch.

Thanks
Padma
>
> --
> ~Vinod
