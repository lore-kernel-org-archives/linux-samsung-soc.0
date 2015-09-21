From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: Re: [PATCH v3 2/4] Documentation: bindings: mfd: cros ec: document
 vbc EC property
Date: Mon, 21 Sep 2015 08:01:02 -0700
Message-ID: <CABxcv=nDbraTFed65qhr-P+Sopz32YW3ut_S11DWR+nJgiSFgw@mail.gmail.com>
References: <1442842703-5309-1-git-send-email-emilio.lopez@collabora.co.uk>
	<1442842703-5309-3-git-send-email-emilio.lopez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yk0-f174.google.com ([209.85.160.174]:34503 "EHLO
	mail-yk0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756848AbbIUPBD convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 21 Sep 2015 11:01:03 -0400
Received: by ykdg206 with SMTP id g206so104680969ykd.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 21 Sep 2015 08:01:03 -0700 (PDT)
In-Reply-To: <1442842703-5309-3-git-send-email-emilio.lopez@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?Q?Emilio_L=C3=B3pez?= <emilio.lopez@collabora.co.uk>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Olof Johansson <olof@lixom.net>, Kukjin Kim <kgene@kernel.org>, =?UTF-8?Q?Krzysztof_Koz=C5=82owski?= <k.kozlowski@samsung.com>, Guenter Roeck <linux@roeck-us.net>, Linux Kernel <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

Hello Emilio,

On Mon, Sep 21, 2015 at 6:38 AM, Emilio L=C3=B3pez
<emilio.lopez@collabora.co.uk> wrote:
> Some EC implementations include a small nvram space used to store
> verified boot context data. This boolean property lets us indicate
> whether this space is available or not on a specific EC implementatio=
n.
>
> Signed-off-by: Emilio L=C3=B3pez <emilio.lopez@collabora.co.uk>

Looks good to me.

Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>

Best regards,
Javier
