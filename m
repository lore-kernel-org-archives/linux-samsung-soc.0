From: Christoffer Dall <christoffer.dall@linaro.org>
Subject: Re: [PATCH v6 3/7] arm64: Add a description on 48-bit address space
 with 4KB pages
Date: Tue, 27 May 2014 22:25:54 +0200
Message-ID: <CAMJs5B8MW_Abni2X=+bdywg9zz5JyaEcDmZ+0MLd79Pn1+ZYtg@mail.gmail.com>
References: <000201cf6dc6$3ed91500$bc8b3f00$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <000201cf6dc6$3ed91500$bc8b3f00$@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jungseok Lee <jays.lee@samsung.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "kvmarm@lists.cs.columbia.edu" <kvmarm@lists.cs.columbia.edu>, Catalin Marinas <Catalin.Marinas@arm.com>, Marc Zyngier <Marc.Zyngier@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Steve Capper <steve.capper@linaro.org>, =?UTF-8?B?7KCV7ISx7KeE?= <sungjinn.chung@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Kukjin Kim <kgene.kim@samsung.com>, Ilho Lee <ilho215.lee@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, May 12, 2014 at 06:40:44PM +0900, Jungseok Lee wrote:
> This patch adds memory layout and translation lookup information
> about 48-bit address space with 4K pages. The description is based
> on 4 levels of translation tables.
>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Steve Capper <steve.capper@linaro.org>
> Signed-off-by: Jungseok Lee <jays.lee@samsung.com>
> Reviewed-by: Sungjinn Chung <sungjinn.chung@samsung.com>
> Acked-by: Kukjin Kim <kgene.kim@samsung.com>
> ---

Looks reasonable to me:

Acked-by: Christoffer Dall <christoffer.dall@linaro.org>
