From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH 02/12] drivers: mfd: Add support for Exynos PMU driver
Date: Wed, 05 Nov 2014 14:47:36 +0100
Message-ID: <545A2A78.5000901@samsung.com>
References: <1414986790-11940-1-git-send-email-amit.daniel@samsung.com>
 <1414986790-11940-3-git-send-email-amit.daniel@samsung.com>
 <20141103152604.GA10544@x1> <002601cff7de$0f8db7e0$2ea927a0$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-pm-owner@vger.kernel.org>
In-reply-to: <002601cff7de$0f8db7e0$2ea927a0$@samsung.com>
Sender: linux-pm-owner@vger.kernel.org
To: Pankaj Dubey <pankaj.dubey@samsung.com>, 'Lee Jones' <lee.jones@linaro.org>
Cc: 'Amit Daniel Kachhap' <amit.daniel@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org, kgene.kim@samsung.com, 'Sangbeom Kim' <sbkim73@samsung.com>, 'Samuel Ortiz' <sameo@linux.intel.com>
List-Id: linux-samsung-soc@vger.kernel.org

On 04/11/14 04:18, Pankaj Dubey wrote:
> 2: Since PM domain relies on PMU registers and does not have 
> its own DT binding, MFD client and MFD device
> is most suitable for making this kind of platform drivers.

We have DT binding for the Exynos power domains:
Documentation/devicetree/bindings/arm/exynos/power_domain.txt
In fact the IO memory regions used in the power domain bindings
fall within the (sparse) PMU registers region.

There is also DT binding for the PMU subsystem:
Documentation/devicetree/bindings/arm/samsung/pmu.txt

I guess a platform device driver in drivers/power would be a better
fit than drivers/mfd. I doubt introducing an mfd driver now makes
much sense, we have already DT bindings for PHYs, the power domains,
etc.

--
Thanks,
Sylwester
