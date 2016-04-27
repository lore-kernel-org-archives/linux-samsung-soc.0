From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [GIT PULL] ARM: EXYNOS: fixes for v4.6
Date: Wed, 27 Apr 2016 11:03:17 +0200
Message-ID: <5647946.YabRqFapJm@wuerfel>
References: <1461738154-8335-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1461738154-8335-1-git-send-email-k.kozlowski@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Kevin Hilman <khilman@kernel.org>, linux-kernel@vger.kernel.org, arm@kernel.org, Kukjin Kim <kgene@kernel.org>, Olof Johansson <olof@lixom.net>
List-Id: linux-samsung-soc@vger.kernel.org

On Wednesday 27 April 2016 08:22:34 Krzysztof Kozlowski wrote:
>   ARM: EXYNOS: Properly skip unitialized parent clock in power domain on (2016-04-25 11:35:37 +0200)
> 
> ----------------------------------------------------------------
> Fix for more theoretical than practical OOPS on first turn on of a exynos
> power domain, if there was no turn off before. Usually all power domains
> are on, so the first action is to turn off but some older bootloaders
> might behave differently.
> 

Pulled into fixes. Linus has just merged a larger set of fixes from
arm-soc, and this one doesn't seem very urgent, so I'd wait for more
important fixes to come up before sending out another pull request.

In the unlikely case that we don't get any critical bugfixes, I'd just
send this one for 4.7.

	Arnd
