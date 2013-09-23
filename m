From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH] DT: if dt is available don't use s3c_arch_init
Date: Mon, 23 Sep 2013 15:58:14 +0530
Message-ID: <CAK9yfHyKik0ZLsgikGUdOc7xPwPee=JNLCr5P3ZdKU6DA5j4Fg@mail.gmail.com>
References: <1379931289-29384-1-git-send-email-m.krawczuk@partner.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f174.google.com ([209.85.214.174]:42990 "EHLO
	mail-ob0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753393Ab3IWK2P (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 23 Sep 2013 06:28:15 -0400
Received: by mail-ob0-f174.google.com with SMTP id uz6so3199453obc.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Sep 2013 03:28:14 -0700 (PDT)
In-Reply-To: <1379931289-29384-1-git-send-email-m.krawczuk@partner.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mateusz Krawczuk <m.krawczuk@partner.samsung.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Ben Dooks <ben-linux@fluff.org>, Russell King <linux@arm.linux.org.uk>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Tomasz Figa <t.figa@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>

Hi Mateusz,

On 23 September 2013 15:44, Mateusz Krawczuk
<m.krawczuk@partner.samsung.com> wrote:
> It prevents from executing platform code, when booting from device tree.
>
> Signed-off-by: Mateusz Krawczuk <m.krawczuk@partner.samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---

nit: Please format the patch title appropriately. In this case, it
should start with
"ARM: SAMSUNG: ..."

-- 
With warm regards,
Sachin
