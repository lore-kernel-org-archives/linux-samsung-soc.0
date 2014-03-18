From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v6 05/10] V4L: s5c73m3: Add device tree support
Date: Tue, 18 Mar 2014 11:05:47 +0100
Message-ID: <201403181105.47922.arnd@arndb.de>
References: <1394122819-9582-1-git-send-email-s.nawrocki@samsung.com>
 <1394122819-9582-6-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1394122819-9582-6-git-send-email-s.nawrocki@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, a.hajda@samsung.com, kyungmin.park@samsung.com, robh+dt@kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, galak@codeaurora.org, kgene.kim@samsung.com, linux-media@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Thursday 06 March 2014, Sylwester Nawrocki wrote:
> This patch adds the V4L2 asynchronous subdev registration and
> device tree support. Common clock API is used to control the
> sensor master clock from within the subdev.
> 
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>

This driver is in linux-next now, but

> +	node_ep = v4l2_of_get_next_endpoint(node, NULL);
> +	if (!node_ep) {
> +		dev_warn(dev, "no endpoint defined for node: %s\n",
> +						node->full_name);
> +		return 0;
>  	}

This function is not defined here, leading to build errors.

	Arnd
