From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [RFC/RFT 5/5] phy: exynos5-usbdrd: drop duplicate setting PIPE3
 tune signal
Date: Wed, 24 Jul 2019 13:14:35 +0200
Message-ID: <CAJKOXPeRjg3tz-o+_cZ=Xy_ALOL06nODeKbthdrvpQqgYpXhOQ@mail.gmail.com>
References: <20190722185938.9043-1-linux.amoon@gmail.com> <20190722185938.9043-6-linux.amoon@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190722185938.9043-6-linux.amoon@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anand Moon <linux.amoon@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>, Kukjin Kim <kgene@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, 22 Jul 2019 at 21:00, Anand Moon <linux.amoon@gmail.com> wrote:
>
> Drop duplicate configuration setting of PIPE tune signal.

There is no duplicate set. This is either completely wrong or put in
wrong order of entire patchset...

Best regards,
Krzysztof
