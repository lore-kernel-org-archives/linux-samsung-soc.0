From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v2] i2c: s3c2410: resume the I2C controller earlier
Date: Wed, 16 Jul 2014 15:31:54 -0700
Message-ID: <CAD=FV=W6OCzXOE9gz9qxGggiVeTHiveg7W-1hnF3_-OKy7RLKQ@mail.gmail.com>
References: <1403654214-25072-1-git-send-email-dianders@chromium.org>
	<20140716173528.GF2759@katana>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140716173528.GF2759@katana>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Cc: Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, Vincent Palatin <vpalatin-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-samsung-soc <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Wolfram,

On Wed, Jul 16, 2014 at 10:35 AM, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org> wrote:
> On Tue, Jun 24, 2014 at 04:56:54PM -0700, Doug Anderson wrote:
>> From: Vincent Palatin <vpalatin-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>>
>> When the wake-up is triggered by the PMIC RTC, the RTC driver is trying
>> to read the PMIC interrupt status over I2C and fails because the I2C
>> controller is not resumed yet.
>> Let's resume the I2C controller earlier in the _noirq phase
>> (as other hardwares are doing), so we can properly get the wake-up
>> condition.
>>
>> Signed-off-by: Vincent Palatin <vpalatin-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>> Signed-off-by: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>
> Applied to for-current (because Tomasz said it fixes issues), thanks! If
> you think the exynos patch of the same style should also be in current,
> please let me know...

Thanks!  I don't think the exynos one needs to go into for-current.
for-next is enough.  :)

-Doug
