From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 1/3] ASoC: samsung: pass DMA channels as
	pointers
Date: Wed, 18 Nov 2015 10:26:49 +0900
Message-ID: <564BD3D9.7000701@samsung.com>
References: <5466463.9HBcuLFGQf@wuerfel> <564A7FF4.7030603@samsung.com>
 <25607973.ZAWqqjj8F4@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-reply-to: <25607973.ZAWqqjj8F4@wuerfel>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>, Sangbeom Kim <sbkim73@samsung.com>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, Vinod Koul <vinod.koul@intel.com>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On 17.11.2015 19:24, Arnd Bergmann wrote:
> On Tuesday 17 November 2015 10:16:36 Krzysztof Kozlowski wrote:
>> On 14.11.2015 02:22, Arnd Bergmann wrote:
>>> ARM64 allmodconfig produces a bunch of warnings when building the
>>> samsung ASoC code:
>>>
>>> sound/soc/samsung/dmaengine.c: In function 'samsung_asoc_init_dma_data':
>>> sound/soc/samsung/dmaengine.c:53:32: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
>>>    playback_data->filter_data = (void *)playback->channel;
>>> sound/soc/samsung/dmaengine.c:60:31: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
>>>    capture_data->filter_data = (void *)capture->channel;
>>>
>>> We could easily shut up the warning by adding an intermediate cast,
>>> but there is a bigger underlying problem: The use of IORESOURCE_DMA
>>> to pass data from platform code to device drivers is dubious to start
>>> with, as what we really want is a pointer that can be passed into
>>> a filter function.
>>>
>>> Note that on s3c64xx, the pl08x DMA data is already a pointer, but
>>> gets cast to resource_size_t so we can pass it as a resource, and it
>>> then gets converted back to a pointer. In contrast, the data we pass
>>> for s3c24xx is an index into a device specific table, and we artificially
>>> convert that into a pointer for the filter function.
>>>
>>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>>
>> The patch looks good. I have only two questions below.
> 
> Thanks for taking a look!
> 
>>> @@ -1338,11 +1325,8 @@ static int samsung_i2s_probe(struct platform_device *pdev)
>>>               sec_dai->dma_playback.dma_addr = regs_base + I2STXDS;
>>>               sec_dai->dma_playback.ch_name = "tx-sec";
>>>  
>>> -             if (!np) {
>>> -                     res = platform_get_resource(pdev, IORESOURCE_DMA, 2);
>>> -                     if (res)
>>> -                             sec_dai->dma_playback.channel = res->start;
>>> -             }
>>> +             if (!np)
>>> +                     sec_dai->dma_playback.slave = i2s_pdata->dma_play_sec;
>>
>> I cannot this resource in original patch nor setting the 'dma_play_sec'
>> part. I guess this does not really matter as newer platforms were
>> converted to DT so 'np' will be set, right?
> 
> Yes, that sounds correct.
> 
>>> @@ -367,12 +367,6 @@ static int spdif_probe(struct platform_device *pdev)
>>>  
>>>       dev_dbg(&pdev->dev, "Entered %s\n", __func__);
>>>  
>>> -     dma_res = platform_get_resource(pdev, IORESOURCE_DMA, 0);
>>> -     if (!dma_res) {
>>> -             dev_err(&pdev->dev, "Unable to get dma resource.\n");
>>> -             return -ENXIO;
>>> -     }
>>> -
>>>       mem_res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>>>       if (!mem_res) {
>>>               dev_err(&pdev->dev, "Unable to get register resource.\n");
>>> @@ -432,7 +426,7 @@ static int spdif_probe(struct platform_device *pdev)
>>>  
>>>       spdif_stereo_out.dma_size = 2;
>>>       spdif_stereo_out.dma_addr = mem_res->start + DATA_OUTBUF;
>>> -     spdif_stereo_out.channel = dma_res->start;
>>> +     spdif_stereo_out.slave = spdif_pdata->dma_playback;
>>>  
>>>       spdif->dma_playback = &spdif_stereo_out;
>>
>> No one sets ioresources and pdata for spdif device. No in-kernel board
>> files for it?
> 
> Hmm, probably also a missing conversion to devicetree. The symbol used to be 
> 
>  config SND_SOC_SAMSUNG_SMDK_SPDIF
>         tristate "SoC S/PDIF Audio support for SMDK"
> -       depends on SND_SOC_SAMSUNG && (MACH_SMDKC100 || MACH_SMDKC110 || MACH_SMDKV210 || MACH_SMDKV310 || MACH_SMDK4212)
> +       depends on SND_SOC_SAMSUNG
>         select SND_SAMSUNG_SPDIF
> 
> We still support all four of the above boards, but they are all DT-only
> and neither spdif.c nor smdk-spdif.c ever gained DT support. Is there
> anything I should change in this patch for this?

No, I think it is okay. I'll review the v2 you sent.

Best regards,
Krzysztof
