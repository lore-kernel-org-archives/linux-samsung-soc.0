From: Tushar Behera <tushar.behera-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] usb: phy: samsung-usb2: Toggle HSIC GPIO from device tree
Date: Wed, 28 Aug 2013 09:25:22 +0530
Message-ID: <CAHbNUh06Rxd9JRieeXCydB_JwiUOrUXADL6nUGZxONQJmz2-CQ@mail.gmail.com>
References: <1373416455-30358-1-git-send-email-jwerner@chromium.org>
	<20130710052534.GB15674@arwen.pp.htv.fi>
	<CAODwPW9dmwpXeyBeVER9azsh2uW3NXLTbDtz3mJaXrvSwb6opg@mail.gmail.com>
	<20130712065734.GE31802@arwen.pp.htv.fi>
	<CAHbNUh0Sa-atYMHbhEUX2vnVAcsdBJxw9RRzAp+6vqE8hi=p1w@mail.gmail.com>
	<20130827184447.GR3005@radagast>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130827184447.GR3005@radagast>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: balbi-l0cyMroinI0@public.gmane.org
Cc: Julius Werner <jwerner-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-samsung-soc <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Praveen Paneri <p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Olof Johansson <olofj-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Vincent Palatin <vpalatin-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On 28 August 2013 00:14, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org> wrote:
> On Tue, Aug 13, 2013 at 02:11:27PM +0530, Tushar Behera wrote:
>> On 12 July 2013 12:27, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org> wrote:
>> > Hi,
>> >
>> > On Wed, Jul 10, 2013 at 10:42:27AM -0700, Julius Werner wrote:
>> >> Hi Felipe,
>> >>
>> >> This is intended to pull down a reset signal line, not to switch power
>> >> to the device. I could implement that with the regulator framework
>> >> too, but I think that would just be confusing and harder to understand
>> >> without providing any benefit. It's really just a plain old GPIO.
>> >
>> > alright, in that case how about using drivers/reset/ ?
>> >
>>
>> IIUC, reset-gpio driver only provides APIs for reset controls (reset,
>> assert, deassert). We still need to find out the location from where
>> we would be calling the reset function.
>
> that's fair, but at least you reuse a bunch of boilerplate code to claim
> the GPIO, set proper direction and value. No need to duplicate that in
> your driver.
>

SMSC3503 driver code was recently updated by Mark Brown [1] which
allows the device to work even if it is not connected to I2C bus. The
timing is still an issue though [2]. With this USB works on
linux-next, but surely that [2] is not the solution.

[1] http://comments.gmane.org/gmane.linux.usb.general/92061
[2] https://lkml.org/lkml/2013/8/14/814
-- 
Tushar Behera
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
