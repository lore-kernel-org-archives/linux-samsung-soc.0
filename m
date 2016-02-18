From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v2] regulator: s2mps11: Simplify expression used in
 BUILD_BUG_ON
Date: Thu, 18 Feb 2016 10:38:47 +0900
Message-ID: <56C520A7.40201@samsung.com>
References: <1455755707-16844-1-git-send-email-k.kozlowski@samsung.com>
 <20160218013705.GI10719@samsunx.samsung>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20160218013705.GI10719@samsunx.samsung>
Sender: linux-kernel-owner@vger.kernel.org
To: Andi Shyti <andi.shyti@samsung.com>
Cc: Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, jacob.e.keller@intel.com, Arnd Bergmann <arnd@arndb.de>
List-Id: linux-samsung-soc@vger.kernel.org

On 18.02.2016 10:37, Andi Shyti wrote:
> Hi Krzysztof,
> 
>> Following BUILD_BUG_ON using a variable fails for some of the compilers
>> and optimization levels (reported for gcc 4.9):
>> 	var = ARRAY_SIZE(s2mps15_regulators);
>> 	BUILD_BUG_ON(S2MPS_REGULATOR_MAX < var);
>> Fix this by using ARRAY_SIZE directly.
>>
>> Additionally add missing BUILD_BUG_ON check for S2MPS15 device (the
>> check ensures that internal arrays are big enough to hold data for all
>> of regulators on all devices).
>>
>> Reported-by: Arnd Bergmann <arnd@arndb.de>
>> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>>
> 
> [...]
> 
>>  	case S2MPS11X:
>>  		s2mps11->rdev_num = ARRAY_SIZE(s2mps11_regulators);
> 
> Why don't we remove rdev_num at all? It's not used that much
> other than in the probe function.

Remove from probe? It is used in probe and removal would make the code
more complicated than it should be.

Best regards,
Krzysztof
