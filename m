From: Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 2/7] clk: samsung: Add clock driver for S3C64xx SoCs
Date: Wed, 19 Jun 2013 23:18:16 +0900
Message-ID: <51C1BDA8.60906@samsung.com>
References: <1370476651-6743-1-git-send-email-tomasz.figa@gmail.com> <2388977.5Y1ahHeZcl@flatron> <20130612165108.26381.54381@quantum> <6817507.KeKqs2jZHz@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <6817507.KeKqs2jZHz@flatron>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On 06/13/13 06:38, Tomasz Figa wrote:

[...]

>>> Another thing is that it's unlikely for any new SoC from S3C64xx
>>> series to show up, so basically the clock list is fixed.
>>
>> Sure.  I can take this into clk-next along with patch #1, or if you
>> prefer:
>>
>> Acked-by: Mike Turquette<mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>
> Thanks.
>
> IMHO with all the remaining platform patches in this series, it should go
> through Samsung tree.
>

Mike, thanks for your ack. Let me take this whole series into samsung 
tree when ready for other dependencies like PWM...

- Kukjin
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
