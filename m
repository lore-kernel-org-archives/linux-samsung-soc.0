From: Anand Moon <linux.amoon@gmail.com>
Subject: Re: [PATCH] Re: Endless "supply vcc not found, using dummy regulator"
Date: Wed, 25 May 2016 17:46:51 +0530
Message-ID: <CANAwSgSS=LPUJ4HXQ_D4tsMYXP=1qG_f_jn-G9xwN6AOKy6QMw@mail.gmail.com>
References: <20160521144308.GA13960@sesse.net> <20160523134737.GA21683@sesse.net>
 <20160523144047.GA36908@sesse.net> <20160523162455.GW8206@sirena.org.uk>
 <20160523170617.GA8997@sesse.net> <CAJKOXPds5PgVmcYLEOriyL-a6tp0jkg7x0GTjPZaN9YLL_gO_A@mail.gmail.com>
 <20160524152638.GA20341@sesse.net> <574478FE.4070800@samsung.com> <20160524192424.GA11690@sesse.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oi0-f65.google.com ([209.85.218.65]:34636 "EHLO
	mail-oi0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753207AbcEYMRL convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 25 May 2016 08:17:11 -0400
In-Reply-To: <20160524192424.GA11690@sesse.net>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "Steinar H. Gunderson" <sgunderson@bigfoot.com>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Mark Brown <broonie@debian.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, 823552@bugs.debian.org, balbi@kernel.org, linux-usb@vger.kernel.org

Hi Steinar,

On 25 May 2016 at 00:54, Steinar H. Gunderson <sgunderson@bigfoot.com> =
wrote:
> On Tue, May 24, 2016 at 05:53:34PM +0200, Krzysztof Kozlowski wrote:
>>         exynos->clk =3D devm_clk_get(dev, "usbdrd30");
>>         if (IS_ERR(exynos->clk)) {
>> +             // On each error path since here we need to
>> +             // revert work done by dwc3_exynos_register_phys()
>>                 dev_err(dev, "couldn't get clock\n");
>>                 return -EINVAL;
>>         }
>>         clk_prepare_enable(exynos->clk);
>
> OK, so I took Mark's advice and moved the phy instantiation towards t=
he end
> of the function (after the regulators have successfully come up). It =
reduced
> the number of probes, even with the original initramfs, dramatically,=
 so
> it seems to work quite well. It also reduces the text for each deferr=
ed probe
> by a lot, since we no longer have the dummy regulator message for eac=
h one
> (only the message about =E2=80=9Cno suspend clk specified=E2=80=9D is=
 left). Finally, this
> arrangement reduced the need for extra error handling to a minimum.
>
> Cc-ing Felipe and and linux-usb@, and adding the patch as a reply to =
this
> message.
>
> /* Steinar */
> --
> Homepage: https://www.sesse.net/
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

Actually their are some missing patches to tune the usb3 phy.

https://lkml.org/lkml/2014/10/31/266

Best Regards
-Anand Moon
