From: Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 1/3] mtd: s3c2410: make ecc mode configurable via
 platform data
Date: Fri, 21 Oct 2016 20:51:51 +0200
Message-ID: <5a626833-d4bf-a991-65ea-2849f2250dce@gmail.com>
References: <1476999766-32526-1-git-send-email-sergio.prado@e-labworks.com>
 <1476999766-32526-2-git-send-email-sergio.prado@e-labworks.com>
 <20161021182710.GA17279@kozik-lap>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161021182710.GA17279@kozik-lap>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sergio Prado <sergio.prado-1e4yhPs3/ABSwrhanM7KvQ@public.gmane.org>
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, richard-/L3Ra7n9ekc@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org, kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, linux-Y5A6D6n0/KfQXOPxS62xeg@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On 10/21/2016 08:27 PM, Krzysztof Kozlowski wrote:
> On Thu, Oct 20, 2016 at 07:42:44PM -0200, Sergio Prado wrote:
>> Removing CONFIG_MTD_NAND_S3C2410_HWECC option and adding a ecc_mode
>> field in the drivers's platform data structure so it can be selectable
>> via platform data.
>>
>> Also setting this field to NAND_ECC_SOFT in all boards using this
>> driver since none of them had CONFIG_MTD_NAND_S3C2410_HWECC enabled.
>>
>> Signed-off-by: Sergio Prado <sergio.prado-1e4yhPs3/ABSwrhanM7KvQ@public.gmane.org>
>> ---
>>  arch/arm/mach-s3c24xx/common-smdk.c            |   1 +
>>  arch/arm/mach-s3c24xx/mach-anubis.c            |   1 +
>>  arch/arm/mach-s3c24xx/mach-at2440evb.c         |   1 +
>>  arch/arm/mach-s3c24xx/mach-bast.c              |   1 +
>>  arch/arm/mach-s3c24xx/mach-gta02.c             |   1 +
>>  arch/arm/mach-s3c24xx/mach-jive.c              |   1 +
>>  arch/arm/mach-s3c24xx/mach-mini2440.c          |   1 +
>>  arch/arm/mach-s3c24xx/mach-osiris.c            |   1 +
>>  arch/arm/mach-s3c24xx/mach-qt2410.c            |   1 +
>>  arch/arm/mach-s3c24xx/mach-rx1950.c            |   1 +
>>  arch/arm/mach-s3c24xx/mach-rx3715.c            |   1 +
>>  arch/arm/mach-s3c24xx/mach-vstms.c             |   1 +
>>  arch/arm/mach-s3c64xx/mach-hmt.c               |   1 +
>>  arch/arm/mach-s3c64xx/mach-mini6410.c          |   1 +
>>  arch/arm/mach-s3c64xx/mach-real6410.c          |   1 +
>>  drivers/mtd/nand/Kconfig                       |   9 --
>>  drivers/mtd/nand/s3c2410.c                     | 119 +++++++++++++------------
>>  include/linux/platform_data/mtd-nand-s3c2410.h |   6 +-
>>  18 files changed, 79 insertions(+), 70 deletions(-)
>>
> 
> I acked this twice (v1 and v2)... and still you are ignoring them. I am
> sorry, I am not gonna to ack this third time!

Hi, um, I am kinda new to this mess, what's going on ? You ACKed
previous patches, next revision was submitted, so you need to ACK
the next revision too (due to the changes).

> For v2 I acked also other patches but it it is not there as well...
> 
> BR,
> Krzysztof


-- 
Best regards,
Marek Vasut
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
