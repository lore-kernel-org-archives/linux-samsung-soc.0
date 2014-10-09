From: Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Subject: Re: [PATCH 3/5] regulator: dt-bindings: Add regulator-initial-mode
 support
Date: Thu, 09 Oct 2014 23:56:59 +0200
Message-ID: <543704AB.4030805@collabora.co.uk>
References: <1412775847-15213-1-git-send-email-javier.martinez@collabora.co.uk> <1412775847-15213-4-git-send-email-javier.martinez@collabora.co.uk> <1412844355.1316.15.camel@AMDC1943> <5436A403.1050109@collabora.co.uk> <20141009190107.GY4609@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141009190107.GY4609-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Abhilash Kesavan <kesavan.abhilash-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On 10/09/2014 09:01 PM, Mark Brown wrote:
> On Thu, Oct 09, 2014 at 05:04:35PM +0200, Javier Martinez Canillas wrote:
> 
>> Agree, Mark also pointed out that there is a difference between changing
>> how the regulator will behave on runtime vs changing how the regulator
>> will behave during system suspend. AFAIU from his explanation, the modes
>> defined in consumer.h only applies to the former and conceptually there
>> should be a difference between those two cases even when the Maxim PMIC
>> seems to mix it both in the data-sheet and by using the same field.
> 
> No, that's not accurate at all - you're still not getting the concepts
> of modes or suspend handling in the regulator API.  I really think you
> need to take a step back and try to understand what's currently there
> before trying to make changes here.  We've got a set of operations we
> can use to change the regulator configuration, if you look at the
> existing driver interface you'll see that these are matched with
> equivalent operations for setting the behaviour when in suspend
> (including a set_suspend_mode() operation).  
> 

I tried to say that there is a difference between the need to change
within the kernel a regulator configuration (e.g: change opmode from
normal to low power) when the system is going to enter in suspend state
vs setting a register at probe time that will force the PMIC to change
the regulator to low power mode on suspend without kernel intervention.

> Like I keep saying abstractions are really important to making sure the
> code is maintainable.
> 

Agree, I'll try to come up with a more sensible solution by using the
existing abstractions from the regulator framework.

Best regards,
Javier
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
