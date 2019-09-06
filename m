From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: cpuidle big_little driver on Odroid-xu4
Date: Fri, 6 Sep 2019 09:52:33 +0200
Message-ID: <CAJKOXPdSmCbkUxbhuoEG8+0U_o1=heHrOeWjrddgy7bedN8Rag@mail.gmail.com>
References: <CAF-0O_5TSO04M=0kdghhGKTs54QVEYn5mBh7e83EusFjS_Hg3Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAF-0O_5TSO04M=0kdghhGKTs54QVEYn5mBh7e83EusFjS_Hg3Q@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jaafar Ali <jaafarkhalaf@gmail.com>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, kgene@kernel.org, sam@ravnborg.org, linux-clk@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Sun, 1 Sep 2019 at 15:19, Jaafar Ali <jaafarkhalaf@gmail.com> wrote:
>
> Dear Sylwester,
> Kernel 5.3rc1
> Hardware Odroid-XU4
> cpuidle-big_little driver for exynos 5422 of odroid-xu3/4 is not working.
> when I enable it in the defconfig , CONFIG_ARM_BIG_LITTLE_CPUIDLE=y,
> the device will not boot and the heartbeat blue LED stops.
> when the powerdown state[1] is removed form cpuidle-big_little driver
> or the function bl_enter_powerdown is disabled by early return, the
> kernel boots successfully and I can see cpuidle driver inside
> /sys/devices/system/cpu/cpuidle/current_driver
> both cpuidle-big_little power down state (exynos5420) and suspend
> stuff are using mcpm_cpu_suspend() which in turn calls
> mcpm_cpu_power_down() eventually.
> while suspend stuff is working correctly and the cpu can
> suspend/resume without problems, the cpuidle-bl is not working
> the few difference between suspend.c and cpuidle-big_little that I
> found are suspend.c do some more preparations such as storing resume
> entry point "mcpm_entry_point" into S5P_INFORM0, reset
> EXYNOS5420_CPU_STATE and save and restore some other registers.
> Can we repeat the scenario of suspend in cpuidle-big_little

Hi Jaafar,

Thank you for the report. I am not sure whether big-little cpuidle was
working properly before... (before v5.3-rc1) I added your report to
https://exynos.wiki.kernel.org/todo_tasks

Best regards,
Krzysztof
