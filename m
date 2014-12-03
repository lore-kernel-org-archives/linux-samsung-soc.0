From: Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: [PATCH] hwrandom / exynos / PM: Use CONFIG_PM in #ifdef
Date: Wed, 3 Dec 2014 12:14:33 +0800
Message-ID: <20141203041433.GA7387@gondor.apana.org.au>
References: <1743562.8SOccckWiK@vostro.rjw.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-pm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1743562.8SOccckWiK@vostro.rjw.lan>
Sender: linux-pm-owner@vger.kernel.org
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux PM list <linux-pm@vger.kernel.org>, Paul Gortmaker <paul.gortmaker@windriver.com>, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Dec 03, 2014 at 02:40:35AM +0100, Rafael J. Wysocki wrote:
> From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> 
> CONFIG_PM is defined as the alternative of CONFIG_PM_RUNTIME and
> CONFIG_PM_SLEEP, so it can be used instead of that.
> 
> Besides, after commit b2b49ccbdd54 (PM: Kconfig: Set PM_RUNTIME if
> PM_SLEEP is selected) PM_RUNTIME is always set if PM is set, so
> using the alternative isn't even necessary.
> 
> Use CONFIG_PM instead of it in drivers/char/hw_random/exynos-rng.c.
> 
> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

Acked-by: Herbert Xu <herbert@gondor.apana.org.au>

> Please let me know if it is OK to take this one into linux-pm.

Sure.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
