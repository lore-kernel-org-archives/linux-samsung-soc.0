From: Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH V2 0/2] Sound support for Exynos4412 Odroid X2, U3 board
Date: Mon, 23 Jun 2014 18:53:03 +0200
Message-ID: <53A85B6F.9090809@samsung.com>
References: <1403108551-25058-1-git-send-email-s.nawrocki@samsung.com>
 <CAD8Lp44h6zc2Rt2MGLjhmNG-YB0kYCWf5G7hX5JmdmBfc1PvKg@mail.gmail.com>
 <53A856AE.1030202@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <53A856AE.1030202-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Drake <drake-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-samsung-soc <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, pawel.moll-5wv7dgnIgG8@public.gmane.org, zhen1.chen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, alsa-devel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On 23/06/14 18:32, Sylwester Nawrocki wrote:
> On 23/06/14 11:40, Daniel Drake wrote:
>> > I tested ODROID-U2's 3.5mm analog headphone jack output with:
>> > 
>> > # speaker-test -c 2 -t wav -l 2
>> > 
>> > On my x86 laptop this command takes ~6 seconds and produces audible output:
>> > "Front left, front right, front left, front right"
>> > 
>> > When those words are reproduced over the speakers, there is a
>> > corresponding message printed to stdout which synchronizes nicely.
>> > 
>> > On ODROID-U2 the same command doesn't work quite right - execution
>> > takes only 3.5 seconds and the audible output is truncated:
>> > "Front left, front right, front"
>> > and the stdout messages do not really coincide with the audio being
>> > reproduced at that time.

Is it still wrong when you set the period manually to 1024, i.e.

# speaker-test -c 2 -t wav -l 2 -p 1024

?

--
Thanks,
Sylwester
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
