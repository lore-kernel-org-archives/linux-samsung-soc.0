From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: Re: [PATCH] ARM: mach-s3c24xx: Fix boolean expressions in
 osiris_dvs_notify
Date: Mon, 7 Jan 2019 14:32:20 -0600
Message-ID: <1abcd26c-aa10-9481-ed53-3c3654842757@embeddedor.com>
References: <20190103201408.GA27754@embeddedor>
 <20190107194324.GC3313@kozik-lap>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190107194324.GC3313@kozik-lap>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Ben Dooks <ben@simtec.co.uk>, Kukjin Kim <kgene@kernel.org>, Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi Krzysztof,

On 1/7/19 1:43 PM, Krzysztof Kozlowski wrote:
> On Thu, Jan 03, 2019 at 02:14:08PM -0600, Gustavo A. R. Silva wrote:
>> Fix boolean expressions by using logical AND operator '&&'
>> instead of bitwise operator '&'.
>>
>> This issue was detected with the help of Coccinelle.
>>
>> Fixes: 4fa084af28ca ("ARM: OSIRIS: DVS (Dynamic Voltage Scaling) supoort.")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
>> ---
>>   arch/arm/mach-s3c24xx/mach-osiris-dvs.c | 8 ++++----
> 
> Thanks, applied with fixing up -Wparentheses warning. I think you should
> update your GCC.
> 

Thanks for that.

I wonder if you could take these too:

https://lore.kernel.org/lkml/418252fcd77472413ce15ac3df167e448a4defe9.1546667177.git.gustavo@embeddedor.com/
https://lore.kernel.org/lkml/2795c5ba939fe23dda6c86135d56e68433f7d68a.1546667177.git.gustavo@embeddedor.com/

Thanks
--
Gustavo
