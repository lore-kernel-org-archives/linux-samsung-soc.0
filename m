From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH] regulator: core: Skip balancing of the enabled
 regulators in regulator_enable()
Date: Wed, 9 Oct 2019 12:29:00 +0200
Message-ID: <c9e3ff21-ec50-97c2-06cb-b2f44c70eac8@samsung.com>
References: <0e222fdd-4407-51ea-b75c-a62621cbe622@samsung.com>
        <20191008120611.GG4382@sirena.co.uk>
        <9268b455-ec66-97e1-909d-f964ac31c0ef@samsung.com>
        <20191008124736.GJ4382@sirena.co.uk>
        <86b9b4b5-cca5-9052-7c87-c5679dfffff4@samsung.com>
        <be8d3280-9855-ed18-b2ab-d7fb28d80b82@gmail.com>
        <20191008161535.GN4382@sirena.co.uk>
        <4ad890b7-705e-94f9-2e61-1f3a60984c91@gmail.com>
        <20191008171747.GS4382@sirena.co.uk>
        <439154a4-1502-40af-7086-d4e3eb24025f@gmail.com>
        <CGME20191008180759epcas3p3c367142db499635c71d9601dd3e63956@epcas3p3.samsung.com>
        <20191008180750.GT4382@sirena.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191008180750.GT4382@sirena.co.uk>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, Dmitry Osipenko <digetx@gmail.com>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Lucas Stach <l.stach@pengutronix.de>, Krzysztof Kozlowski <krzk@kernel.org>, linux-samsung-soc@vger.kernel.org, Viresh Kumar <viresh.kumar@linaro.org>, Kamil Konieczny <k.konieczny@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Mark,

On 08.10.2019 20:07, Mark Brown wrote:
> On Tue, Oct 08, 2019 at 09:00:29PM +0300, Dmitry Osipenko wrote:
>> Properly handling case of a disabled coupled regulator certainly will be
>> useful, but looks like there are no real users for that feature right
>> now and thus no real testing is done.
> Right, sorry - I missed the double negative there.

Okay, then what is the conclusion, as I got lost a bit? How do you want 
this issue to be fixed?

Best regards

-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
