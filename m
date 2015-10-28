From: Alim Akhtar <alim.akhtar@samsung.com>
Subject: Re: [PATCH v3 5/5] drivers/rtc/rtc-s5m.c: add support for S2MPS15 RTC
Date: Wed, 28 Oct 2015 08:44:43 +0530
Message-ID: <56303DA3.5020306@samsung.com>
References: <1445863883-5187-1-git-send-email-alim.akhtar@samsung.com>
 <1445863883-5187-6-git-send-email-alim.akhtar@samsung.com>
 <56302514.4090407@samsung.com> <20151028015323.GZ28319@sirena.org.uk>
 <56303054.8060804@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-reply-to: <56303054.8060804@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Mark Brown <broonie@kernel.org>
Cc: lee.jones@linaro.org, mturquette@baylibre.com, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, rtc-linux@googlegroups.com, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hello,

On 10/28/2015 07:47 AM, Krzysztof Kozlowski wrote:
> On 28.10.2015 10:53, Mark Brown wrote:
>> On Wed, Oct 28, 2015 at 10:29:56AM +0900, Krzysztof Kozlowski wrote:
>>
>>> If that's true, then don't add new compatibles, new names etc. Re-use.
>>> No new code needed, no changes needed. Keep it simple.
>>
>> Well, it depends - it can be useful to get the information about it
>> being a different part into DT so that if in future we realise that
>> there is some difference (perhaps a bug workaround even if the IP is
>> intended to be the same).  Though in the case of a MFD that information
>> can be obtained from the MFD for the device.
>
> We can always differentiate later and introduce new compatible.
> Declaring a compatible right now would be useful only if we really cared
> about using the workaround on older DTBs.
>
> Since I cannot judge the difference (I don't have the datasheet of
> S2MPS15) then I don't see the need of adding new compatible/name for the
> "same device".
>
> Of course maybe there is such need? Alim?
>
Well I did think of keeping the changes as minimal as possible, like 
just have "{ "s2mps15-rtc",        S2MPS14X }", since I don't have 
access to s2mps14 UM, I could not confirm that s2mps14 and s2mps15 are 
exactly the same w.r.t rtc block. So I proposed the current changes.

Well I do agree with Mark here, a name/compatible matching with the pmic 
is good to at least avoid confusion while looking at the sysfs.

> Best regards,
> Krzysztof
>
