From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v9 2/4] phy: core: Add devm_of_phy_get to phy-core
Date: Wed, 05 Mar 2014 17:04:13 +0100
Message-ID: <53174AFD.2040907@gmail.com>
References: <1394033288-5551-1-git-send-email-k.debski@samsung.com> <1394033288-5551-3-git-send-email-k.debski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1394033288-5551-3-git-send-email-k.debski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kamil Debski <k.debski@samsung.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org
Cc: kyungmin.park@samsung.com, kishon@ti.com, t.figa@samsung.com, s.nawrocki@samsung.com, m.szyprowski@samsung.com, gautam.vivek@samsung.com, mat.krawczuk@gmail.com, yulgon.kim@samsung.com, p.paneri@samsung.com, av.tikhomirov@samsung.com, jg1.han@samsung.com, galak@codeaurora.org, matt.porter@linaro.org, tjakobi@math.uni-bielefeld.de, stern@rowland.harvard.edu, sander@humilis.net
List-Id: linux-samsung-soc@vger.kernel.org

On 05.03.2014 16:28, Kamil Debski wrote:
> Adding devm_of_phy_get will allow to get phys by supplying a
> pointer to the struct device_node instead of struct device.
>
> Signed-off-by: Kamil Debski <k.debski@samsung.com>
> ---
>   drivers/phy/phy-core.c  |   31 +++++++++++++++++++++++++++++++
>   include/linux/phy/phy.h |    8 ++++++++
>   2 files changed, 39 insertions(+)

Reviewed-by: Tomasz Figa <t.figa@samsung.com>

Best regards,
Tomasz
