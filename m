From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v10 01/13] clk: samsung: add needed IDs for DMC clocks
 in Exynos5420
Date: Fri, 14 Jun 2019 14:38:05 +0200
Message-ID: <cbfa8fab-7cd0-1508-7b9b-482fefdb4de3@samsung.com>
References: <CGME20190614095320eucas1p2919a6169c997bb81c80416e8a0ede538@eucas1p2.samsung.com>
        <20190614095309.24100-1-l.luba@partner.samsung.com>
        <20190614095309.24100-2-l.luba@partner.samsung.com>
        <CAJKOXPeeVhHS62jiUgwySf5EYzW2Rkvu=HxyA7NjpGZFp=fWYQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAJKOXPeeVhHS62jiUgwySf5EYzW2Rkvu=HxyA7NjpGZFp=fWYQ@mail.gmail.com>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>, Lukasz Luba <l.luba@partner.samsung.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, mturquette@baylibre.com, sboyd@kernel.org, =?UTF-8?Q?Bart=c5=82omiej_=c5=bbo=c5=82nierkiewicz?= <b.zolnierkie@samsung.com>, kgene@kernel.org, Chanwoo Choi <cw00.choi@samsung.com>, kyungmin.park@samsung.com, Marek Szyprowski <m.szyprowski@samsung.com>, myungjoo.ham@samsung.com, keescook@chromium.org, tony@atomide.com, jroedel@suse.de, treding@nvidia.com, digetx@gmail.com, gregkh@linuxfoundation.org, willy.mh.wolff.ml@gmail.com
List-Id: linux-samsung-soc@vger.kernel.org

On 6/14/19 14:04, Krzysztof Kozlowski wrote:
> I do not quite understand why this patch is still being resent instead
> of have been applied some time ago. Are there any issues here? Or are
> there any issues with the entire patchset (except some review comments
> to be resolved)? If not, then this is a dependency which should go
> regardless of other patches. There is no point to keep it pending...
> All other changes, e.g. DTS will have to wait for more cycles till
> this gets in.
> 
> Therefore either please apply this or please comment what is stopping
> dependencies from being applied.

Indeed the first 3 (clk) patches should not be part of the series any more,
I have applied them few days ago - https://lkml.org/lkml/2019/6/6/554
