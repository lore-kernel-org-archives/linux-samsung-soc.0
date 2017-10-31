From: JeffyChen <jeffy.chen@rock-chips.com>
Subject: Re: [PATCH v6 00/10] rockchip: kevin: Enable edp display
Date: Tue, 31 Oct 2017 12:37:43 +0800
Message-ID: <59F7FE17.80405@rock-chips.com>
References: <20171019034812.13768-1-jeffy.chen@rock-chips.com> <2449324.8EdsLz1NaV@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from regular1.263xmail.com ([211.150.99.137]:51270 "EHLO
        regular1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750785AbdJaEiL (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 31 Oct 2017 00:38:11 -0400
In-Reply-To: <2449324.8EdsLz1NaV@phil>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>, seanpaul@chromium.org
Cc: linux-kernel@vger.kernel.org, briannorris@chromium.org, dianders@chromium.org, tfiga@chromium.org, Andrzej Hajda <a.hajda@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Romain Perier <romain.perier@collabora.com>, Russell King <rmk+kernel@armlinux.org.uk>, Philipp Zabel <p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>, dri-devel@lists.freedesktop.org, Jingoo Han <jingoohan1@gmail.com>, David Airlie <airlied@linux.ie>, Kevin Hilman <khilman@baylibre.com>, Catalin Marinas <catalin.marinas@arm.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Krzysztof Kozlowski <krzk@kernel.org>, linux-samsung-soc@vger.kernel.org, Seung-Woo Kim <sw0312.kim@samsung.com>, Inki Dae <inki.dae@samsung.com>, linux-rockchip@lists.infradead.org, Kyung

Hi Heiko,

On 10/31/2017 07:01 AM, Heiko Stuebner wrote:
> As I was just looking at the edp dts change in patch1 again, does this
> series also contain a fix for the issue below [0] ?
>
> I'm still seeing this on 4.14-rc6 with the most recent drm tree merged in.
>
i saw that too, it should due to our psr code...i think Zain has solved 
these in chromeos kernel, i will ask Zain if he have time to upstream 
them, or maybe i'll try to upstream them.
>
> Heiko
>
> [0]
>
> [   27.960120] BUG: scheduling while atomic: kworker/1:1/68/0x00000002
> [   27.974429] Modules linked in: rockchipdrm dw_hdmi analogix_dp drm_kms_helper panel_simple crc32_ce drm crct10dif_ce rockchip_saradc pwm_bl pwm_cros_ec rockchip_thermal ip_tables x_tabl
> es ipv6 smsc95xx smsc75xx ax88179_178a asix usbnet phy_rockchip_pcie pcie_rockchip
> [   28.008769] CPU: 1 PID: 68 Comm: kworker/1:1 Tainted: G        W       4.14.0-rc7-03201-g12490811b353 #559
> [   28.008774] Hardware name: Google Kevin (DT)
> [   28.008825] Workqueue: events analogix_dp_psr_work [rockchipdrm]
> [   28.008828] Call trace:
> [   28.008838] [<ffff000008088d60>] dump_backtrace+0x0/0x378
> [   28.008842] [<ffff0000080890ec>] show_stack+0x14/0x20
> [   28.008847] [<ffff0000089b04d8>] dump_stack+0x9c/0xbc
> [   28.008852] [<ffff0000080ec4b4>] __schedule_bug+0x4c/0x70
> [   28.008856] [<ffff0000089c4828>] __schedule+0x558/0x5e8
> [   28.008859] [<ffff0000089c48f0>] schedule+0x38/0xa0
> [   28.008864] [<ffff0000089c8194>] schedule_hrtimeout_range_clock+0x84/0xe8
> [   28.008867] [<ffff0000089c8208>] schedule_hrtimeout_range+0x10/0x18
> [   28.008870] [<ffff0000089c7c74>] usleep_range+0x64/0x78
> [   28.008882] [<ffff000000ef56e4>] analogix_dp_transfer+0x16c/0xa88 [analogix_dp]
> [   28.008891] [<ffff000000ef2190>] analogix_dpaux_transfer+0x10/0x18 [analogix_dp]
> [   28.008950] [<ffff000000ddbb1c>] drm_dp_dpcd_access+0x4c/0xf8 [drm_kms_helper]
> [   28.008994] [<ffff000000ddbbe4>] drm_dp_dpcd_write+0x1c/0x28 [drm_kms_helper]
> [   28.009002] [<ffff000000ef2130>] analogix_dp_disable_psr+0x60/0xb0 [analogix_dp]
> [   28.009036] [<ffff000000f8398c>] analogix_dp_psr_work+0x4c/0xc0 [rockchipdrm]
> [   28.009040] [<ffff0000080dff44>] process_one_work+0x1d4/0x348
> [   28.009043] [<ffff0000080e0100>] worker_thread+0x48/0x470
> [   28.009048] [<ffff0000080e63d4>] kthread+0x12c/0x130
> [   28.009052] [<ffff000008084b88>] ret_from_fork+0x10/0x18
>
>
>
>
