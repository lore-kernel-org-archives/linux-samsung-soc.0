From: Jaafar Ali <jaafarkhalaf@gmail.com>
Subject: cpuidle big_little driver on Odroid-xu4
Date: Sun, 1 Sep 2019 16:13:03 +0300
Message-ID: <CAF-0O_5TSO04M=0kdghhGKTs54QVEYn5mBh7e83EusFjS_Hg3Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, kgene@kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, sam@ravnborg.org, linux-clk@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Dear Sylwester,
Kernel 5.3rc1
Hardware Odroid-XU4
cpuidle-big_little driver for exynos 5422 of odroid-xu3/4 is not working.
when I enable it in the defconfig , CONFIG_ARM_BIG_LITTLE_CPUIDLE=y,
the device will not boot and the heartbeat blue LED stops.
when the powerdown state[1] is removed form cpuidle-big_little driver
or the function bl_enter_powerdown is disabled by early return, the
kernel boots successfully and I can see cpuidle driver inside
/sys/devices/system/cpu/cpuidle/current_driver
both cpuidle-big_little power down state (exynos5420) and suspend
stuff are using mcpm_cpu_suspend() which in turn calls
mcpm_cpu_power_down() eventually.
while suspend stuff is working correctly and the cpu can
suspend/resume without problems, the cpuidle-bl is not working
the few difference between suspend.c and cpuidle-big_little that I
found are suspend.c do some more preparations such as storing resume
entry point "mcpm_entry_point" into S5P_INFORM0, reset
EXYNOS5420_CPU_STATE and save and restore some other registers.
Can we repeat the scenario of suspend in cpuidle-big_little

Best Regards
-- 
Jaafar Khalaf
