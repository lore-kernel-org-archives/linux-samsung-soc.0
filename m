From: Federico Vaga <federico.vaga@gmail.com>
Subject: [PATCH v5] modify videobuf2-dma-contig and update sta2x11_vip
Date: Thu, 10 Jan 2013 13:46:47 +0100
Message-ID: <1357822010-30419-1-git-send-email-federico.vaga@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devel-bounces@linuxdriverproject.org>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/devel>,
 <mailto:devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/devel/>
List-Post: <mailto:devel@linuxdriverproject.org>
List-Help: <mailto:devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/devel>,
 <mailto:devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: devel-bounces@linuxdriverproject.org
Sender: "devel" <devel-bounces@linuxdriverproject.org>
To: Mauro Carvalho Chehab <mchehab@redhat.com>, Pawel Osciak <pawel@osciak.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Hans Verkuil <hans.verkuil@cisco.com>
Cc: Kamil Debski <k.debski@samsung.com>, Srinivas Kandagatla <srinivas.kandagatla@st.com>, Peter Senna Tschudin <peter.senna@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, devel@driverdev.osuosl.org, Giancarlo Asnaghi <giancarlo.asnaghi@st.com>, linux-samsung-soc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Sachin Kamat <sachin.kamat@linaro.org>, Prabhakar Lad <prabhakar.lad@ti.com>, Sasha Levin <sasha.levin@oracle.com>, linux-media@vger.kernel.org, Tomasz Stanislawski <t.stanislaws@samsung.com>, davinci-linux-open-source@linux.davincidsp.com, Mauro Carvalho Chehab <mchehab@infradead.org>, Jeongtae Park <jtp.park@samsung.com>, Andrzej Pietrasiewicz <andrzej.p@samsung.com>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, linux-arm-kernel@lists.infradead.org, Fabio Estevam <fabio.estevam@freescale.com>, Sakari Ailus <sakari.ailus@iki.fi>, Scott
List-Id: linux-samsung-soc@vger.kernel.org


Just one comment about the first patch. I modified the prototype of the 
dma-contig context allocator:

   -void *vb2_dma_contig_init_ctx(struct device *dev);
   +void *vb2_dma_contig_init_ctx(struct device *dev, gfp_t mem_flags);

Now it accepts a gfp_t parameter to specify the memory flags to use during
buffer allocation. I also modified all existent drivers according to this
modification. I cannot do a compile test on every different platform (I don't
have the time and it takes long time); the modification is tiny but just to
be sure please take a look at it.

To find all drivers which use this memory allocator, I simply did:

   git grep -n -C 1 vb2_dma_contig_init_ctx

and edited all the driver found. If I forgot someone, please tell me
