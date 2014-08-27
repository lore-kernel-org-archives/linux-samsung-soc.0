From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 1/1] regulator: max77802: set opmode to normal if off
 is read from hw
Date: Wed, 27 Aug 2014 23:03:37 +0200
Message-ID: <53FE47A9.1020701@gmail.com>
References: <1409053061-22568-1-git-send-email-javier.martinez@collabora.co.uk> <53FE2446.3040402@gmail.com> <20140827183733.GN17528@sirena.org.uk> <53FE25EB.7060702@gmail.com> <20140827184705.GO17528@sirena.org.uk> <53FE2901.50508@gmail.com> <20140827191526.GS17528@sirena.org.uk> <53FE2F9E.80501@gmail.com> <20140827194411.GU17528@sirena.org.uk> <53FE387F.3030302@gmail.com> <20140827202554.GW17528@sirena.org.uk> <53FE4286.3050305@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <53FE4286.3050305@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Doug Anderson <dianders@chromium.org>, Olof Johansson <olof@lixom.net>, Yuvaraj Kumar C D <yuvaraj.cd@gmail.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On 27.08.2014 22:41, Tomasz Figa wrote:
> On 27.08.2014 22:25, Mark Brown wrote:
>> On Wed, Aug 27, 2014 at 09:58:55PM +0200, Tomasz Figa wrote:
>>> On 27.08.2014 21:44, Mark Brown wrote:
>>
>>>> The point is that if anything was setting the mode to something other
>>>> than normal it was almost certainly a previously running copy of Linux
>>>> and one would expect that if the mode does need to be changed the new
>>>> copy will be doing that anyway.  It's rare enough to need to actively
>>>> manage modes in the first place.
>>
>>> From what I know based on my experience with Samsung boards we used, the
>>> opmodes of regulators are preconfigured by board bootloader to certain
>>> values based on power design of the board (i.e. there is no need to keep
>>> a regulator in full power mode, if on given board only a little fraction
>>> of it is needed).
>>
>> Well, presumably the bootloader is going to run again even for a warm
>> reboot?
> 
> This is strange, but apparently it's not the case for the hardware which
> this patch is supposed to fix or at least this is how I understood it.
> 

OK, I just realized that Javier's problem might be caused by the fact
that the bootloader he use doesn't change the regulators from defaults
at all. In this case this patch is just fine.

Best regards,
Tomasz
