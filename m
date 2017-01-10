From: Shuah Khan <shuahkh@osg.samsung.com>
Subject: Re: [PATCH] usb: dwc3-exynos fix unspecified suspend clk error
 handling
Date: Tue, 10 Jan 2017 12:20:35 -0700
Message-ID: <e8241820-b710-9735-8b61-fc38ca636bd9@osg.samsung.com>
References: <20170110022131.31042-1-shuahkh@osg.samsung.com>
 <CANAwSgQ4Nxyq5itu62qdz18d4xvTu-e3P3ZXK2acLWtzexaaCA@mail.gmail.com>
 <2265318.ybtxfiNn3d@amdc3058>
 <CGME20170110182345epcas1p3112f94aad300625ff1f75860c55a2b7e@epcas1p3.samsung.com>
 <1659345.4CcVdVckN5@amdc3058>
 <23cf318d-b83f-55e6-e980-13133f0ceb8b@osg.samsung.com>
 <20170110185943.qxwnzjg6zzy4zbki@kozik-lap>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170110185943.qxwnzjg6zzy4zbki@kozik-lap>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Felipe Balbi <balbi@kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Anand Moon <linux.amoon@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linux USB Mailing List <linux-usb@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, Shuah Khan <shuahkh@osg.samsung.com>, Javier Martinez Canillas <javier@osg.samsung.com>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: linux-samsung-soc@vger.kernel.org

On 01/10/2017 11:59 AM, Krzysztof Kozlowski wrote:
> On Tue, Jan 10, 2017 at 11:37:24AM -0700, Shuah Khan wrote:
>> On 01/10/2017 11:23 AM, Bartlomiej Zolnierkiewicz wrote:
>>> I also think that regardless of what is decided on making susp_clk
>>> non-optional for some Exynos SoCs we should probably remove the debug
>>> message as it doesn't bring useful information and may be confusing.
>>>
>>> Shuah, can you take care of this?
>>
>> Yes. This message as it reads now is not only confusing, but also can
>> lead users to think something is wrong.
>>
>> I can get rid of it or I could change it from info to debug and change
>> it to read:
>>
>> "Optional Suspend clock isn't found. Diver operation isn't impacted"
> 
> It is even more confusing. If the clock is required (by binding, by
> hardware) - make it an error. If it is completely not important - do not
> print anything. If it is optional but helpful (enabling clock gives
> someything) then print something... but it is not that case.
> 
> Best regards,
> Krzysztof
> 

Sounds fair. I will send a patch to remove the message.

-- Shuah
