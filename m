From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 2/3] ASoC: AC97: S3C: Add controller driver
Date: Tue, 26 Jan 2010 11:09:45 +0000
Message-ID: <20100126110945.GJ15759@rakim.wolfsonmicro.main>
References: <1264485101-13782-1-git-send-email-jassisinghbrar@gmail.com>
	<1264485101-13782-2-git-send-email-jassisinghbrar@gmail.com>
	<20100126102343.GA24843@trinity.fluff.org>
	<1b68c6791001260303m38e6e689p2ee8c2c4c6ac2af3@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
Content-Disposition: inline
In-Reply-To: <1b68c6791001260303m38e6e689p2ee8c2c4c6ac2af3@mail.gmail.com>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
	<mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
	<mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Sender: alsa-devel-bounces@alsa-project.org
Errors-To: alsa-devel-bounces@alsa-project.org
To: jassi brar <jassisinghbrar@gmail.com>
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, Jassi Brar <jassi.brar@samsung.com>, Ben Dooks <ben-linux@fluff.org>, linux-arm-kernel@lists.infradead.org, lrg@slimlogic.co.uk
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, Jan 26, 2010 at 08:03:09PM +0900, jassi brar wrote:

> The only reason I didn't submit patch to delete s3c2443-ac97.c is that my
>  smdk2443 didn't produce any sound. (btw the s3c2443-ac97.c also fails to do so)

If they both work equally well please just go ahead and remove the old
driver.  Keeping the old driver around if it doesn't work is likely to
result in any fixups going into that.
