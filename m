From: Federico Vaga <federico.vaga@gmail.com>
Subject: Re: [PATCH v5] modify videobuf2-dma-contig and update sta2x11_vip
Date: Thu, 10 Jan 2013 16:22:39 +0100
Message-ID: <1491201.YT9CD19YNt@harkonnen>
References: <1357822010-30419-1-git-send-email-federico.vaga@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devel-bounces@linuxdriverproject.org>
In-Reply-To: <1357822010-30419-1-git-send-email-federico.vaga@gmail.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/devel>,
 <mailto:devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/devel/>
List-Post: <mailto:devel@linuxdriverproject.org>
List-Help: <mailto:devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/devel>,
 <mailto:devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: devel-bounces@linuxdriverproject.org
Sender: "devel" <devel-bounces@linuxdriverproject.org>
To: Mauro Carvalho Chehab <mchehab@redhat.com>
Cc: Kamil Debski <k.debski@samsung.com>, Srinivas Kandagatla <srinivas.kandagatla@st.com>, Peter Senna Tschudin <peter.senna@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Marek Szyprowski <m.szyprowski@samsung.com>, devel@driverdev.osuosl.org, Giancarlo Asnaghi <giancarlo.asnaghi@st.com>, linux-samsung-soc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Sachin Kamat <sachin.kamat@linaro.org>, Prabhakar Lad <prabhakar.lad@ti.com>, Hans Verkuil <hans.verkuil@cisco.com>, Sasha Levin <sasha.levin@oracle.com>, linux-media@vger.kernel.org, Tomasz Stanislawski <t.stanislaws@samsung.com>, Pawel Osciak <pawel@osciak.com>, davinci-linux-open-source@linux.davincidsp.com, Mauro Carvalho Chehab <mchehab@infradead.org>, Jeongtae Park <jtp.park@samsung.com>, Andrzej Pietrasiewicz <andrzej.p@samsung.com>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, linux-arm
List-Id: linux-samsung-soc@vger.kernel.org

We have some new ideas for this new complex architecture (sta2x11) that can 
fix our DMA problems without change the existent code. Obviously, ideas arrive 
when I already sent the patches. Anyway, consider this patch series as an RFC. 
They are not ready for the mainline. I take some time to investigate on the 
architecture side of the project to try to fix our problem.

Anyway, if you consider interesting configure the gfp flags for dma-contig, I 
can propose a v6 series which correct the alloc coherent line.

Sorry for the spam :(

-- 
Federico Vaga
