From: nick <xerofoify@gmail.com>
Subject: Re: [PATCH RESENDv2] mach:-s3c64xx:Output trace information with
 WARN_ON if calls for setting up gpio board configuration fail in
 s3c64xx_i2s_cfg_gpio
Date: Wed, 30 Sep 2015 22:26:31 -0400
Message-ID: <560C99D7.2090006@gmail.com>
References: <1443578870-14534-1-git-send-email-xerofoify@gmail.com>
 <560C74C7.7030409@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <560C74C7.7030409@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, kgene@kernel.org
Cc: linux-samsung-soc@vger.kernel.org, linux@arm.linux.org.uk, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org



On 2015-09-30 07:48 PM, Krzysztof Kozlowski wrote:
> On 30.09.2015 11:07, Nicholas Krause wrote:
>> This fixes the function s3c64xx_i2c_cfg_gpio to log output to the 
>> kernel log buff with WARN_ON if any of the calls to either 
>> s3c_gpio_cfgpin_range or s3c_gpio_cfgpin fail as we cannot exit 
>> from s3c64xx_i2s_cfg_gpio if any of these calls fail due to 
>> other intended function work being required to complete.
> 
> This is better now.
> 
>> Therefore
>> due to this output our failed calls by means of WARN_ON to the
>> kernel log buffer for failed configuration of gpio devices using
>> this driver file.
> 
> I don't get this sentence. What do you want to say?
> 
Fixed this in the v3 version.
> 
>> v2:Fix Patch Wording as it was clearly confusing and incorrect
> 
> Changelog goes after --- separator.
> 
> Last question - have you compiled it? I mean truly compiled like
> generated object file and linked objects into vmlinux?
I rebuild and it seems indeed there was a build warning. Sometimes through
rarely ccache can cause issues with this and therefore did a clean build to
make sure that the build was indeed working correctly without failure.
Sorry,
Nick 
> 
> Best regards,
> Krzysztof
> 
>>
>> Signed-off-by: Nicholas Krause <xerofoify@gmail.com>
>> ---
>>  arch/arm/mach-s3c64xx/dev-audio.c | 10 +++++-----
>>  1 file changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/arch/arm/mach-s3c64xx/dev-audio.c b/arch/arm/mach-s3c64xx/dev-audio.c
>> index ff780a8..5e7538b 100644
>> --- a/arch/arm/mach-s3c64xx/dev-audio.c
>> +++ b/arch/arm/mach-s3c64xx/dev-audio.c
>> @@ -36,10 +36,10 @@ static int s3c64xx_i2s_cfg_gpio(struct platform_device *pdev)
>>  		base = S3C64XX_GPE(0);
>>  		break;
>>  	case 2:
>> -		s3c_gpio_cfgpin(S3C64XX_GPC(4), S3C_GPIO_SFN(5));
>> -		s3c_gpio_cfgpin(S3C64XX_GPC(5), S3C_GPIO_SFN(5));
>> -		s3c_gpio_cfgpin(S3C64XX_GPC(7), S3C_GPIO_SFN(5));
>> -		s3c_gpio_cfgpin_range(S3C64XX_GPH(6), 4, S3C_GPIO_SFN(5));
>> +		WARN_ON(s3c_gpio_cfgpin(S3C64XX_GPC(4), S3C_GPIO_SFN(5)));
>> +		WARN_ON(s3c_gpio_cfgpin(S3C64XX_GPC(5), S3C_GPIO_SFN(5)));
>> +		WARN_ON(s3c_gpio_cfgpin(S3C64XX_GPC(7), S3C_GPIO_SFN(5)));
>> +		WARN_ON(s3c_gpio_cfgpin_range(S3C64XX_GPH(6), 4, S3C_GPIO_SFN(5));)
>>  		return 0;
>>  	default:
>>  		printk(KERN_DEBUG "Invalid I2S Controller number: %d\n",
>> @@ -47,7 +47,7 @@ static int s3c64xx_i2s_cfg_gpio(struct platform_device *pdev)
>>  		return -EINVAL;
>>  	}
>>  
>> -	s3c_gpio_cfgpin_range(base, 5, S3C_GPIO_SFN(3));
>> +	WARN_ON(s3c_gpio_cfgpin_range(base, 5, S3C_GPIO_SFN(3)));
>>  
>>  	return 0;
>>  }
>>
> 
