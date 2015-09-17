From: nick <xerofoify@gmail.com>
Subject: Re: [PATCH] mach-s3c64xx:Fix error handling for certain calls to
 s3c_gpio_cfgpin_range in the file dev-audio.c
Date: Wed, 16 Sep 2015 22:48:07 -0400
Message-ID: <55FA29E7.1070902@gmail.com>
References: <1442454673-26752-1-git-send-email-xerofoify@gmail.com>
 <55FA1FEE.5070506@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <55FA1FEE.5070506@samsung.com>
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



On 2015-09-16 10:05 PM, Krzysztof Kozlowski wrote:
> On 17.09.2015 10:51, Nicholas Krause wrote:
>> This fixes error handling for calls to the function
>> s3c_gpio_cfgpin_range in the file dev-audio.c that
>> assume calls to this particular function always run
>> successfully to properly check now if these calls
>> fail by returning a error code and if so return it
>> directly to the call of these functions in order for
>> the caller to be able to handle these failed calls in
>> its own error path(s).
>>
>> Signed-off-by: Nicholas Krause <xerofoify@gmail.com>
>> ---
>>  arch/arm/mach-s3c64xx/dev-audio.c | 12 +++++++-----
>>  1 file changed, 7 insertions(+), 5 deletions(-)
> 
> I am assuming (from the past events) that you did not test the patch and
> how returning the error condition affects rest of the code. In the same
> time you ignored my request to mark such patches with Request-For-Test.
> 
I will resend with a better commit message but testing is really difficult 
as that would require me to have a device for all the drivers I am currently
writing for. However I will be glad to put a Request-For-Test and a better 
commit message in a v2 to show I didn't write this blindly.
Sorry,
Nick
> Please send it after testing.
> 
> Commit message is hard to understand, please re-phrase so it would be
> easily to find how this affects upper layers.
> 
> As you are banned on LKML, the patch needs thorough testing and review
> before applying.
> 
> Best regards,
> Krzysztof
> 
>>
>> diff --git a/arch/arm/mach-s3c64xx/dev-audio.c b/arch/arm/mach-s3c64xx/dev-audio.c
>> index ff780a8..81fabdb 100644
>> --- a/arch/arm/mach-s3c64xx/dev-audio.c
>> +++ b/arch/arm/mach-s3c64xx/dev-audio.c
>> @@ -27,6 +27,7 @@
>>  static int s3c64xx_i2s_cfg_gpio(struct platform_device *pdev)
>>  {
>>  	unsigned int base;
>> +	int ret;
>>  
>>  	switch (pdev->id) {
>>  	case 0:
>> @@ -47,9 +48,9 @@ static int s3c64xx_i2s_cfg_gpio(struct platform_device *pdev)
>>  		return -EINVAL;
>>  	}
>>  
>> -	s3c_gpio_cfgpin_range(base, 5, S3C_GPIO_SFN(3));
>> -
>> -	return 0;
>> +	ret = s3c_gpio_cfgpin_range(base, 5, S3C_GPIO_SFN(3));
>> +
>> +	return ret;
>>  }
>>  
>>  static struct resource s3c64xx_iis0_resource[] = {
>> @@ -122,6 +123,7 @@ EXPORT_SYMBOL(s3c64xx_device_iisv4);
>>  static int s3c64xx_pcm_cfg_gpio(struct platform_device *pdev)
>>  {
>>  	unsigned int base;
>> +	int ret;
>>  
>>  	switch (pdev->id) {
>>  	case 0:
>> @@ -136,8 +138,8 @@ static int s3c64xx_pcm_cfg_gpio(struct platform_device *pdev)
>>  		return -EINVAL;
>>  	}
>>  
>> -	s3c_gpio_cfgpin_range(base, 5, S3C_GPIO_SFN(2));
>> -	return 0;
>> +	ret = s3c_gpio_cfgpin_range(base, 5, S3C_GPIO_SFN(2));
>> +	return ret;
>>  }
>>  
>>  static struct resource s3c64xx_pcm0_resource[] = {
>>
> 
