From: Boojin Kim <boojin.kim@samsung.com>
Subject: RE: [PATCH v6 04/10] DMA: PL330: Add device tree support
Date: Wed, 12 Oct 2011 13:04:29 +0900
Message-ID: <000a01cc8894$0a785f60$1f691e20$%kim@samsung.com>
References: <1318270538-30450-1-git-send-email-thomas.abraham@linaro.org>
	<1318270538-30450-2-git-send-email-thomas.abraham@linaro.org>
	<1318270538-30450-3-git-send-email-thomas.abraham@linaro.org>
	<1318270538-30450-4-git-send-email-thomas.abraham@linaro.org>
	<1318270538-30450-5-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <1318270538-30450-5-git-send-email-thomas.abraham@linaro.org>
Content-language: ko
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: 'Thomas Abraham' <thomas.abraham@linaro.org>, linux-arm-kernel@lists.infradead.org
Cc: vinod.koul@intel.com, kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, 'Jassi Brar' <jassisinghbrar@gmail.com>
List-Id: linux-samsung-soc@vger.kernel.org

Thomas Abraham wrote:

> Sent: Tuesday, October 11, 2011 3:16 AM
> To: linux-arm-kernel@lists.infradead.org
> Cc: linux-samsung-soc@vger.kernel.org; kgene.kim@samsung.com;
> vinod.koul@intel.com; Jassi Brar; Boojin Kim
> Subject: [PATCH v6 04/10] DMA: PL330: Add device tree support
>
> For PL330 dma controllers instantiated from device tree, the channel
> lookup is based on phandle of the dma controller and dma request id
> specified by the client node. During probe, the private data of each
> channel of the controller is set to point to the device node of the
> dma controller. The 'chan_id' of the each channel is used as the
> dma request id.
>
> Client driver requesting dma channels specify the phandle of the
> dma controller and the request id. The pl330 filter function
> converts the phandle to the device node pointer and matches that
> with channel's private data. If a match is found, the request id
> from the client node and the 'chan_id' of the channel is matched.
> A channel is found if both the values match.
>
> Cc: Jassi Brar <jassisinghbrar@gmail.com>
> Cc: Boojin Kim <boojin.kim@samsung.com>
> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
> Reviewed-by: Rob Herring <rob.herring@calxeda.com>
> Acked-by: Jassi Brar <jassisinghbrar@gmail.com>
> Acked-by: Grant Likely <grant.likely@secretlab.ca>
> ---

Looks good to me.
Acked-by: Boojin Kim <boojin.kim@samsung.com>
