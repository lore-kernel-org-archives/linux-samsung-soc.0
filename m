From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [GIT PULL] soc: samsung: Drivers for v4.11
Date: Thu, 26 Jan 2017 10:13:10 +0100
Message-ID: <CACRpkdZebsd5MfARWL2WbKkAuXfjEe6p_k5tYwPFF6kSsCXDdQ@mail.gmail.com>
References: <20170120181343.12570-1-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170120181343.12570-1-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@kernel.org>, "arm@kernel.org" <arm@kernel.org>, Kukjin Kim <kgene@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, Jan 20, 2017 at 7:13 PM, Krzysztof Kozlowski <krzk@kernel.org> wrote:

> Few changes in Exynos PMU driver including one that is needed by pinctrl
> driver for runtime PM. We want to move forward with the RPM for our drivers
> while keeping still DT ABI.
>
> This tag is also for Linus Walleij to pull - base for pinctrl changes.

Do I need it? I.e. will my branch not compile without this, or is this
just a runtime problem?

Yours,
Linus Walleij
