From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH] regulator: core: Skip balancing of the enabled
 regulators in regulator_enable()
Date: Thu, 10 Oct 2019 12:19:55 +0200
Message-ID: <c1a50291-5260-357d-1701-47526dbcd62c@samsung.com>
References: <20191008124736.GJ4382@sirena.co.uk>
        <86b9b4b5-cca5-9052-7c87-c5679dfffff4@samsung.com>
        <be8d3280-9855-ed18-b2ab-d7fb28d80b82@gmail.com>
        <20191008161535.GN4382@sirena.co.uk>
        <4ad890b7-705e-94f9-2e61-1f3a60984c91@gmail.com>
        <20191008171747.GS4382@sirena.co.uk>
        <439154a4-1502-40af-7086-d4e3eb24025f@gmail.com>
        <CGME20191008180759epcas3p3c367142db499635c71d9601dd3e63956@epcas3p3.samsung.com>
        <20191008180750.GT4382@sirena.co.uk>
        <c9e3ff21-ec50-97c2-06cb-b2f44c70eac8@samsung.com>
        <20191009141352.GC3929@sirena.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191009141352.GC3929@sirena.co.uk>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Dmitry Osipenko <digetx@gmail.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Lucas Stach <l.stach@pengutronix.de>, Krzysztof Kozlowski <krzk@kernel.org>, linux-samsung-soc@vger.kernel.org, Viresh Kumar <viresh.kumar@linaro.org>, Kamil Konieczny <k.konieczny@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Mark,

On 09.10.2019 16:13, Mark Brown wrote:
> On Wed, Oct 09, 2019 at 12:29:00PM +0200, Marek Szyprowski wrote:
>
>> Okay, then what is the conclusion, as I got lost a bit? How do you want
>> this issue to be fixed?
> We should revert the enable call, it shouldn't be required, and ideally
> the default balancer could be updated to only make configuration changes
> if they're actually required which would help avoid triggering any such
> things in future if we don't absolutely have to.

Okay, Then in case of regulator core - do you accept the initial patch 
as it indeed forces the default balancer to avoid unnecessary changes, 
or do you want me to rewrite it to assume min_uV = current_uV for the 
already enabled regulators during the initial balancing, like suggested 
by Dmitry?

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
