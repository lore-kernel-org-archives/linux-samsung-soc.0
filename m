From: nick <xerofoify@gmail.com>
Subject: Re: Weird/Unneeded call to msleep in exynos_mipi_dsi_wr_data in
 exynos_mipi_dsi_common.c
Date: Thu, 18 Dec 2014 09:08:05 -0500
Message-ID: <5492DFC5.4060202@gmail.com>
References: <54920A54.2060608@gmail.com> <5492ABE7.1060900@samsung.com>	
 <5492D80E.3010906@gmail.com> <1418909978.2236.0.camel@pengutronix.de>
 <5492DB1A.2020704@gmail.com> <5492DF0D.3080607@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <5492DF0D.3080607@ti.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: =?UTF-8?B?S3J6eXN6dG9mIEtvesWCbw==?= =?UTF-8?B?d3NraQ==?= <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org, dh09.lee@samsung.com, linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org, inki.dae@samsung.com, kyungmin.park@samsung.com, kgene@kernel.org, plagnioj@jcrosoft.com, linux-arm-kernel@lists.infradead.org, Lucas Stach <l.stach@pengutronix.de>
List-Id: linux-samsung-soc@vger.kernel.org



On 2014-12-18 09:05 AM, Tomi Valkeinen wrote:
> On 18/12/14 15:48, nick wrote:
>> Lucas,
>> That's fair do you known of anyone who does have the hardware so we can test my patch. If you do then we can get this fixed rather
>> easily.
>> Cheers Nick 
>>
>> On 2014-12-18 08:39 AM, Lucas Stach wrote:
>>> Am Donnerstag, den 18.12.2014, 08:35 -0500 schrieb nick:
>>>> Krzysztof,
>>>> If we look at the code for this function, it already is handling the data correctly. In addition  the locks 
>>>> seem to be better protection then msleep. Further more is no reason for this delay as we are neither resetting 
>>>> the hardware or waiting for the hardware here so why is it needed? I don't have Exynos based hardware lying
>>>> around through to test it.
>>>
>>> If you can't test it, don't touch it. It's that simple.
> 
> There seems to be multiple msleep(20)s in exynos_mipi_dsi_common.c, a
> few with /* FIXME */ and a few without any comments. Looks like bad (but
> relatively harmless) code to me, but as Lucas said, if you can't test
> it, don't touch it.
> 
>  Tomi
> 
> 
Tomi,
That is totally fair, sorry for wasting your time :(. I was just trying to help out.
Cheers Nick 
