From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: Re: [PATCH v2 3/3] ARM: dts: Enable EC vboot context support on Peach boards
Date: Tue, 15 Sep 2015 15:49:40 +0200
Message-ID: <CABxcv==qZESJAjPOWLF-QiBZeCeUL9tfLmExzmBS5zX+DLd=7w@mail.gmail.com>
References: <1442234049-18637-1-git-send-email-emilio.lopez@collabora.co.uk>
	<1442234049-18637-4-git-send-email-emilio.lopez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yk0-f178.google.com ([209.85.160.178]:34741 "EHLO
	mail-yk0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751811AbbIONtl convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 15 Sep 2015 09:49:41 -0400
Received: by ykdg206 with SMTP id g206so185447582ykd.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 15 Sep 2015 06:49:40 -0700 (PDT)
In-Reply-To: <1442234049-18637-4-git-send-email-emilio.lopez@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?Q?Emilio_L=C3=B3pez?= <emilio.lopez@collabora.co.uk>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Olof Johansson <olof@lixom.net>, Kukjin Kim <kgene@kernel.org>, =?UTF-8?Q?Krzysztof_Koz=C5=82owski?= <k.kozlowski@samsung.com>, Guenter Roeck <linux@roeck-us.net>, Linux Kernel <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

Hello Emilio,

On Mon, Sep 14, 2015 at 2:34 PM, Emilio L=C3=B3pez
<emilio.lopez@collabora.co.uk> wrote:
> The Peach boards use the EC to store the vboot context information,
> so add the corresponding properties on the EC node to indicate so.
>
> Signed-off-by: Emilio L=C3=B3pez <emilio.lopez@collabora.co.uk>
> ---

Acked-by: Javier Martinez Canillas <javier@osg.samsung.com>

Best regards,
Javier
