From: Vinod Koul <vinod.koul@intel.com>
Subject: Re: [PATCH v3 2/4] dmaengine: add driver for Samsung s3c24xx SoCs
Date: Mon, 2 Sep 2013 17:21:57 +0530
Message-ID: <20130902115157.GQ7376@intel.com>
References: <201308280012.41638.heiko@sntech.de>
 <201308280013.52076.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:38247 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756346Ab3IBMiL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 2 Sep 2013 08:38:11 -0400
Content-Disposition: inline
In-Reply-To: <201308280013.52076.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Cc: kgene.kim@samsung.com, Dan Williams <djbw@fb.com>, linus.walleij@linaro.org, Tomasz Figa <tomasz.figa@gmail.com>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org

On Wed, Aug 28, 2013 at 12:13:51AM +0200, Heiko St=FCbner wrote:
> This adds a new driver to support the s3c24xx dma using the dmaengine
> and makes the old one in mach-s3c24xx obsolete in the long run.
>=20
> Conceptually the s3c24xx-dma feels like a distant relative of the pl0=
8x
> with numerous virtual channels being mapped to a lot less physical on=
es.
> The driver therefore borrows a lot from the amba-pl08x driver in this
> regard. Functionality-wise the driver gains a memcpy ability in addit=
ion
> to the slave_sg one.
>=20
> The driver supports both the method for requesting the peripheral use=
d
> by SoCs before the S3C2443 and the different method for S3C2443 and l=
ater.
>=20
> On earlier SoCs the hardware channels usable for specific peripherals=
 is
> constrainted while on later SoCs all channels can be used for any per=
ipheral.
>=20
> Tested on a s3c2416-based board, memcpy using the dmatest module and
> slave_sg partially using the spi-s3c64xx driver.
>=20

> +static int s3c24xx_dma_control(struct dma_chan *chan, enum dma_ctrl_=
cmd cmd,
> +			 unsigned long arg)
> +{
> +	struct s3c24xx_dma_chan *s3cchan =3D to_s3c24xx_dma_chan(chan);
> +	struct s3c24xx_dma_engine *s3cdma =3D s3cchan->host;
> +	unsigned long flags;
> +	int ret =3D 0;
> +
> +	/* Controls applicable to inactive channels */
> +	if (cmd =3D=3D DMA_SLAVE_CONFIG)
> +		return s3c24xx_dma_set_runtime_config(s3cchan,
> +					      (struct dma_slave_config *)arg);
> +
> +	/*
> +	 * Anything succeeds on channels with no physical allocation and
> +	 * no queued transfers.
> +	 */
> +	spin_lock_irqsave(&s3cchan->vc.lock, flags);
> +	if (!s3cchan->phy && !s3cchan->at) {
> +		spin_unlock_irqrestore(&s3cchan->vc.lock, flags);
> +		return 0;
this can be bad cmd or terminating already closed channel, return 0 doe=
snt make
sense
> +	}
> +
> +	switch (cmd) {
> +	case DMA_TERMINATE_ALL:
why not DMA_SLAVE_CONFIG in this switch to make it look simpler...


> +static enum dma_status s3c24xx_dma_tx_status(struct dma_chan *chan,
> +		dma_cookie_t cookie, struct dma_tx_state *txstate)
> +{
> +	struct s3c24xx_dma_chan *s3cchan =3D to_s3c24xx_dma_chan(chan);
> +	struct virt_dma_desc *vd;
> +	unsigned long flags;
> +	enum dma_status ret;
> +	size_t bytes =3D 0;
> +
> +	ret =3D dma_cookie_status(chan, cookie, txstate);
> +	if (ret =3D=3D DMA_SUCCESS)
> +		return ret;
> +
> +	/*
> +	 * There's no point calculating the residue if there's
> +	 * no txstate to store the value.
> +	 */
> +	if (!txstate)
> +		return ret;
> +
> +	spin_lock_irqsave(&s3cchan->vc.lock, flags);
> +	ret =3D dma_cookie_status(chan, cookie, txstate);
you are checking the cookie status twice, if you check txstate (which s=
hould be
valid anyways), then you avoid the duplication

> +	if (ret !=3D DMA_SUCCESS) {
> +		struct s3c24xx_txd *txd;
> +		struct s3c24xx_sg *dsg;
> +
> +		vd =3D vchan_find_desc(&s3cchan->vc, cookie);
> +		if (vd) {
> +			/* On the issued list, so hasn't been processed yet */
> +			txd =3D to_s3c24xx_txd(&vd->tx);
> +
> +			list_for_each_entry(dsg, &txd->dsg_list, node)
> +				bytes +=3D dsg->len;
> +		} else {
> +			/*
> +			 * Currently running, so sum over the pending sg's and
> +			 * the currently active one.
> +			 */
> +			txd =3D s3cchan->at;
> +
> +			dsg =3D list_entry(txd->at, struct s3c24xx_sg, node);
> +			list_for_each_entry_from(dsg, &txd->dsg_list, node);
> +				bytes +=3D dsg->len;
> +
> +			bytes +=3D s3c24xx_dma_getbytes_chan(s3cchan);
> +		}
> +	}
> +	spin_unlock_irqrestore(&s3cchan->vc.lock, flags);
> +
> +	/*
> +	 * This cookie not complete yet
> +	 * Get number of bytes left in the active transactions and queue
> +	 */
> +	dma_set_residue(txstate, bytes);
> +
> +	/* Whether waiting or running, we're in progress */
> +	return ret;
> +}
> +
> +/*
> + * Initialize a descriptor to be used by memcpy submit
> + */
> +static struct dma_async_tx_descriptor *s3c24xx_dma_prep_memcpy(
> +		struct dma_chan *chan, dma_addr_t dest, dma_addr_t src,
> +		size_t len, unsigned long flags)
> +{
> +	struct s3c24xx_dma_chan *s3cchan =3D to_s3c24xx_dma_chan(chan);
> +	struct s3c24xx_dma_engine *s3cdma =3D s3cchan->host;
> +	struct s3c24xx_txd *txd;
> +	struct s3c24xx_sg *dsg;
> +
> +	dev_dbg(&s3cdma->pdev->dev, "prepare memcpy of %d bytes from %s\n",
> +			len, s3cchan->name);
> +
> +	if ((len & S3C24XX_DCON_TC_MASK) !=3D len) {
> +		dev_err(&s3cdma->pdev->dev, "memcpy size %d to large\n", len);
> +		return NULL;
> +	}
> +
> +	txd =3D s3c24xx_dma_get_txd();
> +	if (!txd)
> +		return NULL;
> +
> +	dsg =3D kzalloc(sizeof(struct s3c24xx_sg), GFP_NOWAIT);
sizeof(*dsg)

~Vinod
