From: Eric Biggers <ebiggers@kernel.org>
Subject: [Bug] s5p-sss crypto driver doesn't set next AES-CBC IV
Date: Fri, 15 Feb 2019 10:51:00 -0800
Message-ID: <20190215185058.GB12909@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Christoph Manszewski <c.manszewski@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>, Kamil Konieczny <k.konieczny@partner.samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

Hello,

The AES-CBC implementation in the s5p-sss crypto driver is failing the improved
crypto self-tests I currently have out for review.  The improved tests check
that all CBC implementations update the IV buffer to be the last ciphertext
block.  This has always been required so that requests can be chained, but
unfortunately it wasn't tested for by the self-tests until now.

See the boot logs for Exynos platforms from the KernelCI job here:
https://kernelci.org/boot/all/job/ardb/branch/for-kernelci/kernel/v5.0-rc1-149-g64c945c018af/

alg: skcipher: cbc-aes-s5p encryption test failed (wrong output IV) on test vector 0, cfg=\"in-place\"
00000000: 3d af ba 42 9d 9e b4 30 b4 22 da 80 2c 9f ac 41

You can reproduce by pulling from
https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git
branch "iv-out-testing", unsetting CONFIG_CRYPTO_MANAGER_DISABLE_TESTS,
setting CONFIG_CRYPTO_MANAGER_EXTRA_TESTS=y, rebooting and checking dmesg.

(CRYPTO_MANAGER_EXTRA_TESTS is probably unneeded for this, but you might as well
use it.  Also you can optionally revert the last patch, which makes crypto
self-test failures cause a kernel panic for testing purposes.  It's possible
that ctr-aes-s5p is failing too but it was just never gotten to...)

The patch series is also available on the linux-crypto mailing list:
https://patchwork.kernel.org/cover/10811951/

Note that I don't have this hardware myself, so if it turns out that no one is
interested in fixing this anytime soon I'll instead have to propose disabling
these algorithm(s) until they can be fixed.

Thanks,

- Eric
