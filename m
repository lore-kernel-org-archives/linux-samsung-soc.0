From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 07/15] arm: dts: exynos: Add missing cooling device
 properties for CPUs
Date: Wed, 30 May 2018 10:08:06 +0530
Message-ID: <20180530043806.ksen4xyh3x3x4fqn@vireshk-i7>
References: <cover.1527244200.git.viresh.kumar@linaro.org>
 <cfd8de4b2ad1cfd7b0f1a0706c0b6b918e1ebffc.1527244201.git.viresh.kumar@linaro.org>
 <CAJKOXPcyV=fdRu7oLXHMimSFR9ktJ23uBriswTStkEkAMbTaNw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAJKOXPcyV=fdRu7oLXHMimSFR9ktJ23uBriswTStkEkAMbTaNw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: arm@kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kukjin Kim <kgene@kernel.org>, Vincent Guittot <vincent.guittot@linaro.org>, ionela.voinescu@arm.com, Daniel Lezcano <daniel.lezcano@linaro.org>, chris.redpath@arm.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On 29-05-18, 15:18, Krzysztof Kozlowski wrote:
> Thanks for the patch.
> 
> In case of Exynos, the booting CPU always has these information in DT
> and the booting CPU cannot be changed (chosen by firmware/hardware
> configuration).

But can the booting CPU be offlined ?

If yes, then this is how things are broken right now.

Build cpufreq driver as module, boot kernel, hotplug out CPU0, insert
cpufreq driver and that will try to find these properties in CPU1.

> Therefore there is no real risk of falling although
> for correctness of DT your change makes sense.
> 
> It is too late for this cycle for me so I'll pick it up after merge window.
> Alternatively, arm-soc guys can pick it up directly with my tag:
> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

No worries, you can pick it up later on.

-- 
viresh
