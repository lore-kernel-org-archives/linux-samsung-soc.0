From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v9 1/2] regulator: Add driver for max77802 PMIC PMIC regulators
Date: Fri, 22 Aug 2014 15:15:04 -0700
Message-ID: <CAD=FV=WC0h7fYm2QFqu3Zka7CsU4BtG-oyPpJav+ygC+gmCR+A@mail.gmail.com>
References: <1408350762-15520-1-git-send-email-javier.martinez@collabora.co.uk>
	<1408350762-15520-2-git-send-email-javier.martinez@collabora.co.uk>
	<CA+NduCDL65=Y=PyU3FfXsTz0FfbmYzicGrY4U7ji3_V+nXhtCQ@mail.gmail.com>
	<53F73472.8010609@collabora.co.uk>
	<20140822144531.GV24407@sirena.org.uk>
	<53F7838F.8060906@collabora.co.uk>
	<20140822183054.GY24407@sirena.org.uk>
	<53F7BDD8.7060500@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53F7BDD8.7060500-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Cc: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Yuvaraj Cd <yuvaraj.lkml-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-samsung-soc <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Abhilash Kesavan <a.kesavan-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Prashanth G <prashanth.g-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Alim Akhtar <alim.akhtar-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, sunil joshi <joshi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

On Fri, Aug 22, 2014 at 3:02 PM, Javier Martinez Canillas
<javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org> wrote:
> Hello Mark,
>
> On 08/22/2014 08:30 PM, Mark Brown wrote:
>>
>>> The problem is that one of these regulators is used as the vqmmc-supply
>>> (VCCQ/VDD_IO) so the mmc host controller driver disables it on
>>> MMC_POWER_OFF. Now AFAIK (Yuvaraj can correct me what I got wrong) this
>>> shouldn't be an issue since on card detection, the vqmmc supply should be
>>> enabled again but on Exynos the built-in card detect line is on the same
>>> power rail as vqmmc. That means that disabling the regulator prevents card
>>> insertions to be detected.
>>
>> If the MMC host controller needs a supply enabling in order to do card
>> detection and it's supposed to be doing card detection I'd expect it to
>> be enabling that supply.  Why is it not doing that?
>>
>
> Good question. I'm not that familiar with the dw_mmc host controller nor
> its driver implementation so I'll let Yuvaraj or Doug to answer that.

I haven't seen the issue that Yuvaraj is reporting (but I also haven't
picked up all of the relevant patches and tried to reproduce), so I'm
going to have to leave it to Yuvaraj to answer.

As far as I know the dw_mmc driver ought to be enabling vqmmc when it
needs it.  Perhaps there's a bug in your patch series that adds vqmmc
support to dw_mmc?

-Doug
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
